
import matplotlib
import matplotlib.pylab as plt
import numpy as np

class ReadFile:

    def __init__(self, _file_name):
        try:
            self.data_x = []
            self.data_y = []

            file_h = open(_file_name, 'r')

            text_string = file_h.read().split('\n')
            for word in text_string:
                data = self.extract_x_y(word)
                if data[0] is True:
                    self.add(data[1])
            #print("all_data: x={}, y={}".format(self.data_x, self.data_y))

        except:
            print("Error")
            raise
        finally:
            file_h.close()

    def add(self, _data):
        self.data_x.append(_data[0])
        self.data_y.append(_data[1])
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
        self.ax = plt.figure(figsize=(6, 6))
        hte = np.array(_data[0])
        hre = np.array(_data[1])
        self.line, = plt.plot(hte, hre, linewidth=2, color='r')
        plt.xlabel('X - Title')
        plt.ylabel('Y - title')
        plt.title('$Our Chart$')
        plt.grid(True)
        plt.draw()
        plt.show()
        self.ax.savefig('testfig_600dpi.png', dpi=600)
        #plt.savefig('testfig.png')

        pass

    def plot_it(self):
        pass


if __name__ == '__main__':
    #1280x1024
    read_f = ReadFile(
        "/Users/talzoor/git_projects/BGU_Fish_lab/fish-trainerNEW/data/log/2018-08-19 113234_F145DAY6.(0).txt")
    #data = read_f.data
    PlotTraj([read_f.data_x, read_f.data_y])
