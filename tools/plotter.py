
import matplotlib.pylab as plt
import numpy as np
from pathlib import Path
from datetime import datetime
import os


def find_nth_overlapping(haystack, needle, n):
    start = haystack.find(needle)
    while start >= 0 and n > 1:
        start = haystack.find(needle, start+1)
        n -= 1
    return start


class ReadFile:

    def __init__(self, _file_name):
        try:
            self.fish_no = -1
            self.date = -1
            self.ttl_time = -1

            self.data_x = []
            self.data_y = []

            my_file = Path(_file_name)
            file_ex = my_file.is_file()
            if file_ex:
                file_h = open(_file_name, 'r')
                text_lines = file_h.read().split('\n')

                self.fish_no, self.t_date, self.train_day = self.file_prop(_file_name)
                training_end = training_start = self.extract_time(text_lines[0], self.t_date)

                for word in text_lines:
                    data = self.extract_x_y(word)
                    timeformat_time = self.extract_time(word, self.t_date)
                    if type(timeformat_time) == type(training_end):
                        bool_later = True if timeformat_time > training_end else False
                        if bool_later:
                            training_end = timeformat_time

                    if data[0] is True:
                        self.add(data[1])


                ttl_training_time = training_end - training_start
                self.traning_start_str = str(training_start)
                self.total_training_time = ttl_training_time

            elif not file_ex:
                print("File does not exist!")

        except:
            print("Error")
            raise
        finally:
            if file_ex: file_h.close()

    def add(self, _data):
        self.data_x.append(_data[0])
        self.data_y.append(_data[1])
        pass


    @staticmethod
    def file_prop(_file_name):
        log_place = _file_name.find("log")
        date_end_place = _file_name.find(" ", log_place)
        _F_place = _file_name.find("_F")
        DAY_place = _file_name.find("DAY")
        DAY_end_place = _file_name.find(".", DAY_place)

        traning_date = _file_name[log_place+4:date_end_place]
        traning_day = _file_name[DAY_place+3:DAY_end_place]
        fish_no = _file_name[_F_place+2:DAY_place]
        return fish_no, traning_date, traning_day

    @staticmethod
    def extract_x_y(_str):
        data_ok = False
        [x, y] = [0, 0]
        track_place = _str.find("track")

        if track_place is not -1:
            data_ok = True
            x_pos_start = track_place+len("track") + 1
            x_pos_end = _str.find(' ', x_pos_start)
            y_pos_start = x_pos_end + 1
            try:
                [x, y] = _str[x_pos_start:x_pos_end], _str[y_pos_start:]
                [x, y] = [float(x), float(y)]
            except ValueError:
                data_ok = False
                pass

        return data_ok, [x, y]

    @staticmethod
    def extract_time(_str, _date):
        time_timeformat = ''
        if _str:
            time_start_place = find_nth_overlapping(_str, " ", 2)
            time_end_place = _str.find('.')
            time_str = _str[time_start_place+1:time_end_place]
            time_date_str = "{} {}".format(_date, time_str)
            t_format = '%Y-%m-%d %H:%M:%S'
            time_timeformat = datetime.strptime(time_date_str, t_format)

        return time_timeformat

    def file_data(self):
        return [self.data_x, self.data_y]


class PlotTraj:

    def __init__(self, properties, _xlabel='X', _ylabel='Y'):

        self.plt = plt
        self.ax = self.plt.figure(figsize=(6, 6))
        self.data = []
        self.line = []
        self.info = properties

        self.plt.xlabel(_xlabel)
        self.plt.ylabel(_ylabel)

        self.plt.grid(True)
        pass

    def plot_it(self, _data):
        self.data = _data
        hte = np.array(_data[0])
        hre = np.array(_data[1])
        self.line, = plt.plot(hte, hre, linewidth=0.5, color='black')
        info = self.info
        plt.title('$Fish-{}$ \nTraining day:{}\nDate:{}, Total time:{}'.
                  format(info[0], info[1], info[2], info[3]))
        self.plt.draw()
        self.plt.show()
        self.save()

    def save(self, project_wd=''):
        if not project_wd:
            runing_dw = os.getcwd()
            fish_trainerNEW_end_place = runing_dw.find("fish-trainerNEW") + len("fish-trainerNEW")
            project_wd = runing_dw[:fish_trainerNEW_end_place]

        info = self.info
        folder_name = os.path.join(project_wd, "data\log-img", info[0])

        dir_ex = os.path.exists(folder_name)
        print("folder_name:{}, exists:{}".format(folder_name, dir_ex))

        if dir_ex:
            pass
        else:
            os.makedirs(folder_name)

        time_info = str(info[2]).replace(':', '')
        file_name_to_save = "{}.png".format(time_info)
        full_name = os.path.join(folder_name, file_name_to_save)
        print("full_name:{}".format(full_name))
        self.ax.savefig(full_name, dpi=600)


def run(_file_to_plot):
    print("Checking file-{}".format(_file_to_plot))
    read_f = ReadFile(_file_to_plot)

    file_data = read_f.file_data()
    if not file_data[0] and not file_data[1]:
        print("No data!")
    else:
        plot_fig = PlotTraj([read_f.fish_no,
                             read_f.train_day,
                             read_f.traning_start_str,
                             read_f.total_training_time])
        plot_fig.plot_it(file_data)

if __name__ == '__main__':
    #1280x1024
    file_to_check = "../data/log/2018-08-12 062039_F145DAY2.(0).txt"       # for example
    run(file_to_check)

