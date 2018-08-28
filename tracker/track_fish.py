#!/usr/bin/env python

import cv2
from time import sleep

width = []
height = []
tank = []
fgbg = []
fish = []
video_capture = None
stop_training=False

#tank_config='../tracker/tank_config.txt'
def init_tracking(tank_config='tracker/tank_config.txt',video=None):
    global video_capture

    with open(tank_config) as f:
        lines = f.read().splitlines()
    for line in lines:
        fish.append(eval(line))
    print fish

    # if a video path was not supplied, grab the reference to the webcam
    if video is None:
        video_capture = cv2.VideoCapture(0)
    # otherwise, grab a reference to the video file
    else:
        video_capture = cv2.VideoCapture(video)

    id = 0
    for fishy in fish:
        fgbg.append(cv2.bgsegm.createBackgroundSubtractorMOG())
        width.append(fishy['right'] - fishy['left'])
        height.append(fishy['lower'] - fishy['upper'])
        tmp_str = 'width: {0}, height: {1}'.format(width[id], height[id])
        print tmp_str

        id = id + 1

    return width


def track_loop(cb, _version='reg'): #cb is an object that has a do() function in the calling script
    global stop_training

    print("_version:{}".format(_version))
    while stop_training is False:
        stop_training = cb.check_traning()

        cb.time()
        # Capture frame-by-frame
        ret, frame = video_capture.read()
        if frame is None:
            print 'No Image'
            break  # check for empty frames

        id = 0
        for fishy in fish:
            frame_cut = frame[fishy['upper']:fishy['lower'], fishy['left']:fishy['right']]
            fgmask = fgbg[id].apply(frame_cut)
            fgmask = cv2.erode(fgmask, None, iterations=2)
            mask = cv2.dilate(fgmask, None, iterations=2)

            tank_width = abs(fishy['upper']-fishy['lower'])
            tank_height = abs(fishy['left']-fishy['right'])
            # print("tank_dim:{}/{}".format(tank_width, tank_height))


            paint_lines(cv2, tank_width, tank_height, frame_cut, _version)

            cv2.imshow("image" + str(id), frame_cut)
            cv2.imshow("mask" + str(id), fgmask)
            cv2.waitKey(1)

            # find contours in the mask and initialize the current
            # (x, y) center of the ball
            cnts = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[-2]

            max_rad = 0
            for cntr in cnts:
                ((x, y), radius) = cv2.minEnclosingCircle(cntr)
                if radius > max_rad:
                    largest_cntr = cntr
                    max_rad = radius
            # check if largest_cntr is set
            if len(cnts) > 0:
                ((x, y), radius) = cv2.minEnclosingCircle(largest_cntr)
                cv2.circle(frame_cut, (int(x), int(y)), int(radius), (0, 255, 255), 2)  # show radius for debbuging
                cv2.imshow("image"+str(id), frame_cut)
                cv2.waitKey(1)

                if cb is not None:
                    cb.do(x, y, id, _version)


            id = id + 1
        # TBD - inclear where to put
        # if cv2.waitKey(1) & 0xFF == ord('q'): break #Exit when Q is pressed

    # exit while loop:
    id_out = 0
    for fishy in fish:
        #print("fish_id:{}".format(id_out))
        cb.end_training(id_out)
        id_out += 1
        sleep(0.5)


def paint_lines(_cv_obj, _tank_width, _tank_height, _frame, _ver):
    if _ver is 'reg':
        low_boundry = float(1/4)
        hige_boundry = float(3/4)
    elif _ver is 'mid':
        low_boundry = float(3 / 8)
        hige_boundry = float(5 / 8)

    left_up = int(_tank_height * low_boundry)
    left_down = int(_tank_height * hige_boundry)

    _cv_obj.line(_frame, (left_up, 40), (left_down, 40), (255, 255, 255), 2)
    _cv_obj.line(_frame, (_tank_height - 30, 30), (_tank_height - 30, _tank_width - 30), (255, 255, 255), 1)


def paint_single_line(_cv_obj, (x0, y0), (x1, y1), _frame, gap = 0):
    if gap == 0:
        _cv_obj.line(_frame, (x0, y0), (x1, y1), (255, 255, 255), 1)
    else:
        pass

if __name__ == '__main__':
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("-v", "--video", help="path to the (optional) video file")
    ap.add_argument("-f", "--file", help="path to scene file")
    args = vars(ap.parse_args())
    init_tracking(args["file"])
    track_loop(None)

    # Release the camera
    video_capture.release()
    print("Bye...")






