
class ReadFile:

    def __init__(self, _file_name):
        try:
            self.data = []

            file = open(_file_name, 'r')

            text_string = file.read().split('\n')
            for word in text_string:
                data = self.extract_x_y(word)
                if data[1] is True:
                    self.add(data[2])

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
        print("track_p:{}".format(track_place))
        if track_place is not -1:
            data_ok = True
            x_pos_start = track_place+len("track") + 1
            x_pos_end = _str.find(' ', )
            y_pos = x_pos + 6
            [x, y] = _str[x_pos:x_pos + 4], _str[y_pos:y_pos + 4]
        print("_str:{} --> ok:{}, data:{}".format(_str, data_ok, [x, y]))
        data_ok = False
        [x, y] = [0, 0]
        return data_ok, [x, y]

class PlotTraj:

    def __init__(self, _data):
        pass

    def plot_it(self):
        pass


if __name__ == '__main__':
    read_f = ReadFile("C:/Users/Owner/PycharmProjects/fish-trainerNEW/data/log/2018-08-26 125922_F555DAY4.(0).txt")