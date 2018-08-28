#! /usr/bin/env python
#
# Support module generated by PAGE version 4.10
# In conjunction with Tcl version 8.6
#    Feb 24, 2018 06:27:58 PM
#    Apr 23, 2018 08:54:50 PM


import sys
import subprocess
import threading
from tracker import scene_planner
from tracker.controller import Controller
from tracker import track_fish
from tracker.tcp_client import FishClient
from time import sleep

stop_traning = False

try:
    from Tkinter import *
except ImportError:
    from tkinter import *

try:
    import ttk
    py3 = 0
except ImportError:
    import tkinter.ttk as ttk
    py3 = 1


def set_Tk_var():
    global FeedVar
    FeedVar = StringVar()

    global chb_Var
    chb_Var = StringVar()

    # chb_Var = '1'




def onLogClear():
    sys.stdout.flush()
    Fish_traningGUI.txtMainLog.delete('0.0', END)


def Feed():
    print('ClientGUI_support.Feed')
    sys.stdout.flush()

def on1L():
    global chb_Var
    global FeedVar

    try:
        print('ClientGUI_support.on1L')
        fish_client = FishClient(Fish_traningGUI)
        #print('chb_Var:{}'.format(chb_Var.get()))

        fish_client.send('test_1L', Fish_traningGUI.txtStepNum.get())
        fish_client.kill()
        sys.stdout.flush()
    except TypeError:
        pass

def on1R():
    print('ClientGUI_support.on1R')
    fish_client = FishClient(Fish_traningGUI)
    fish_client.send('test_1R', Fish_traningGUI.txtStepNum.get())
    fish_client.kill()
    sys.stdout.flush()

def on2L():
    print('ClientGUI_support.on2L')
    velocity = Fish_traningGUI.txtVelocity.get()
    acceleration = Fish_traningGUI.txtAccl.get()

    fish_client = FishClient(Fish_traningGUI)
    fish_client.send('test_2L', 0, Fish_traningGUI.txtStepNum.get(), velocity, acceleration)
    fish_client.kill()

    sys.stdout.flush()

def on2R():
    print('ClientGUI_support.on2R')
    velocity = Fish_traningGUI.txtVelocity.get()
    acceleration = Fish_traningGUI.txtAccl.get()

    fish_client = FishClient(Fish_traningGUI)
    fish_client.send('test_2R', 0, Fish_traningGUI.txtStepNum.get(), velocity, acceleration)
    fish_client.kill()
    sys.stdout.flush()

def onExit():
    global exit_var, stop_traning
    print('ClientGUI_support.onExit')
    sys.stdout.flush()

    exit_var = True
    Fish_traningGUI.stop_traning = True

    sleep(1)
    sys.exit(1)

def onRunTraining():
    global stop_traning
    sys.stdout.flush()

    Fish_traningGUI.stop_traning = False
    log_name = []
    log_name.append('F{}DAY{}'.format(Fish_traningGUI.txtFishNo1.get('0.0', 'end-1c'), Fish_traningGUI.txtTrainingDay1.get('0.0', 'end-1c')))

    try:
        _tmp1 = type(controller)
        controller.__del__()
    except UnboundLocalError:
        print("there is not Controller instance")

    controller = Controller(Fish_traningGUI, log_name)
    _tmp1 = type(controller)
    print("type:{}".format(_tmp1))
    thread_track_fish = threading.Thread(target=track_fish.track_loop, args=(controller,))

    thread_track_fish.daemon = True
    thread_track_fish.start()

def onStopTraining():
    global stop_traning, Fish_traningGUI
    sys.stdout.flush()
    Fish_traningGUI.stop_traning = True
    Fish_traningGUI.print_and_update_main_log("Stopped!")

def onSendtest():
    print('ClientGUI_support.onSendtest')
    sys.stdout.flush()
    fish_client = FishClient()
    fish_client.send('test', 0)
    fish_client.kill()

def onStatClear():
    sys.stdout.flush()
    Fish_traningGUI.txtStatLog.delete('0.0', END)


def onTankConfig():
    print('ClientGUI_support.onTankConfig')
    sys.stdout.flush()
    thread_track_fish = threading.Thread(target=scene_planner.SP_Main, args=())
    thread_track_fish.start()


def onSetZero():
    print('ClientGUI_support.onSetZero')
    btn_txt = Fish_traningGUI.btnSetZero['text']
    if btn_txt == "Set ZERO pos.":
        Fish_traningGUI.btnSetZero.configure(text='END')
        _str_to_send = 'SetZeroStart'
    else:
        Fish_traningGUI.btnSetZero.configure(text='Set ZERO pos.')
        _str_to_send = 'SetZeroEND'

    fish_client = FishClient()
    fish_client.send(_str_to_send, 0)
    fish_client.kill()

def onStatRun():
    global Fish_traningGUI
    sys.stdout.flush()
    _StatInfo = ThreadingProcess('fish_stat.py',
                                 Fish_traningGUI.LogFolderName,
                                 Fish_traningGUI.txtStatDaysBack.get('0.0', END),
                                 Fish_traningGUI.txtStatArgs.get('0.0', END)).run()
    Fish_traningGUI.txtStatLog.insert(END, _StatInfo)
    Fish_traningGUI.txtStatLog.see(END)
    # print "HERE:{}".format(StatInfo)

def init(top, gui, *args, **kwargs):
    global Fish_traningGUI, top_level, root
    Fish_traningGUI = gui
    top_level = top
    root = top

def destroy_window():
    # Function which closes the window.
    global top_level
    top_level.destroy()
    top_level = None

class ThreadingProcess(object):

    def __init__(self, file_name, arg0='', arg1='', arg2=''):
        self.interval = 1
        self.file_name = file_name
        self.arg0 = arg0
        self.arg1 = arg1
        self.arg2 = arg2

        #thread = threading.Thread(target=self.run(), args=args)
        #thread.daemon = True                            # Daemonize thread
        #thread.start()                                  # Start the execution


    def runTrack(self, process):
        try:

            str_name = [sys.executable, self.file_name, self.arg0, self.arg1, self.arg2]
            process = subprocess.Popen(str_name, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            output, error_output = process.communicate()
            print(process.stdout.readline())
        except:
            print 'Err - Check (.py) call file'
            if output=='': output=error_output

        #return output

    def run(self):
        #print self.file_name
        #while True:
        #    print('Doing something imporant in the background')
        #file = '/Users/talzoor/PycharmProjects/test/fish_stat.py'
        try:
            process = subprocess.Popen(['python', self.file_name, self.arg0, self.arg1, self.arg2], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            output, error_output = process.communicate()

        except:
            print 'Err - Check (fish_stat.py) call file'

        if output=='': output=error_output
        return output


class Counter(object):
    def __init__(self, start=0):
        self.lock = threading.Lock()
        self.value = start

    def increment(self):
        logging.debug('Waiting for a lock')
        self.lock.acquire()
        try:
            logging.debug('Acquired a lock')
            self.value = self.value + 1
        finally:
            logging.debug('Released a lock')
            self.lock.release()



if __name__ == '__main__':
    import ClientGUI
    ClientGUI.vp_start_gui()





