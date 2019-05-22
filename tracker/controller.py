#!/usr/bin/env python

from tracker import track_fish
from tracker.old_tcp_client import FishClient
from tracker.fish_tank import Tank
from tools import fishlog
from tracker.time_counter import TimeCounter
import argparse
import os
import time
from tools import plotter
from time import sleep



FEED_EVERY = 3          # feed every 3 sec


# TODO:
# - create seperate log file for each fish
# - insert fish client send and test with feeder
# -


class Controller:
    def __init__(self, feed, cb_obj=None, log_name=['test'], _camera=0):
        global total_feed
        global time_counter
        total_feed = 0
        time_counter = 0

        self.feed = feed

        self.time_count = TimeCounter()
        self.cb_obj = cb_obj
        self.chb_Var = cb_obj.chb_Var
        print("chb_Var_cont:{}".format(self.chb_Var.get()))
        self.time_last_feed = int(round(time.time()))

        width = track_fish.init_tracking(int(_camera))

        # init logger
        #   full_script_path = '{}{}'.format(os.path.dirname(os.path.realpath(__file__)), '/')
        #   full_root_script_path = full_script_path[:full_script_path.find('tracker')]
        #   log_folder = '{}data/log/'.format(full_root_script_path)
        full_script_path = os.path.dirname(os.path.realpath(__file__))
        trainerNEW_end_place = full_script_path.find(r"fish-trainerNEW") + len("fish-trainerNEW/")
        full_root_script_path = full_script_path[:trainerNEW_end_place]
        log_folder = os.path.join(full_root_script_path, r"data\log")
        print("full_script_path:{}\nfull_root_script_path:{}\nlog_folder:{}".
              format(full_script_path, full_root_script_path, log_folder))

        #print_and_update_main_log('log:{}'.format(log_folder))
        self.logger = []

        #init tank
        self.tank = []
        id = 0
        #print ('Tank(1, 1):' + str(Tank(1, 1)))
        for size in width:
            self.tank.append(Tank(id, size))
            self.logger.append(fishlog.FishLog(log_folder, "{}.({})".format(log_name[id], str(id))))
            id = id + 1


    def __del__(self):  #Destroy
        print ('Controller closed')


    def time(self):
        time_str = self.time_count.get_time_diff()
        if time_str:
            #print (time_str)
            self.cb_obj.update_time(time_str)

    def check_traning(self):
        _int_tmp = self.cb_obj.stop_traning
        return _int_tmp

    def end_training(self, fish_id):
        log_filename = self.logger[fish_id].filename
        self.logger[fish_id].fo.close()
        sleep(0.2)  # 200mS wait
        print("fish_id:{}, filename:{}".format(fish_id, log_filename))

        plotter.run(log_filename, show=True, overwrite=True)
        sleep(1.5)

    def do(self, x, y, fish_id, _version):
        global total_feed

        time_now = int(round(time.time()))

        self.logger[fish_id].add_tracked_point(x, y)
        if time_now - self.time_last_feed > FEED_EVERY:     # feed every..
            feed_side = self.tank[fish_id].decide(x, y, _version)
        else:
            feed_side = None

        if feed_side is 'center':
            #feed_side = 'left'     # only send 'left' (socket)
            pass
        if feed_side is 'out_center':
            feed_side = None

        if feed_side is not None:
            total_feed += 1
            str_to_print = '{}\t,{}\t - \tTotal:{}'.format(fish_id, feed_side, total_feed)
            self.time_last_feed = time_now

            if self.cb_obj is not None:
                self.cb_obj.print_and_update_main_log(str_to_print)
            fish_client = FishClient()
            if self.chb_Var.get() == '1':
                print("FEED NOW")

                self.feed.new_feeder_run(0, feed_side)
                # fish_client.send(fish_id + 11, feed_side)
            else:
                pass
                # print("FEED NOW")
                # fish_client.send(fish_id + 1, feed_side)
            # fish_client.kill()

            #fish_client.send(fish_id, feed_side)
            self.logger[fish_id].add_feed(feed_side)

    def time_count(self):
        global time_counter
        print(time_counter)


# ap = argparse.ArgumentParser()
# ap.add_argument("-log", "--log", required=True, help="path to log folder")
# args = vars(ap.parse_args())
if __name__ == '__main__':
    controller = Controller()
    track_fish.track_loop(controller)

