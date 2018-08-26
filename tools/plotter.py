
import matplotlib
from pylab import *


class ReadFile:

    def __init__(self, _file_name):
        try:
            self.data = []

            file = open(_file_name, 'r')

            text_string = file.read().split('\n')
            for word in text_string:
                data = self.extract_x_y(word)
                if data[0] is True:
                    self.add(data[1])
            #print("all_data:{}".format(self.data))

        except:
            print("Error")
            raise
        finally:
            file.close()

    def add(self, _data):
        self.data.append(_data)
        pass

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
            [x, y] = _str[x_pos_start:x_pos_end], _str[y_pos_start:]
            [x, y] = [float(x), float(y)]
        #print("_str:{} --> ok:{}, data:{}".format(_str, data_ok, [x, y]))

        return data_ok, [x, y]


class PlotTraj:

    def __init__(self, _data):
        self.data = _data
        self.ax = subplot(111)
        self.line, = plot(1, 2, linewidth=2, color='r')
        xlabel('X - Title')
        ylabel('Y - title')
        title('$Our Chart$')
        grid(True)
        draw()
        show()
        pass

    def plot_it(self):
        pass


if __name__ == '__main__':
    read_f = ReadFile(
        "/Users/talzoor/git_projects/BGU_Fish_lab/fish-trainerNEW/data/log/2018-08-19 113234_F145DAY6.(0).txt")
    PlotTraj([0, 0])
