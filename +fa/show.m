function show(name, color, size, axes)
impath = fa.Util.getpath(name);
if nargin < 4
    argadd = {};
else
    argadd = {'Parent', axes};
end
[im, ~, alpha] = imread(impath);
if nargin > 1 && ~isempty(color)
    if nargin > 2 && ~isempty(size)
        im = fa.Util.resize(im, size);
        alpha = fa.Util.resize(alpha, size);
    end
    im = fa.Util.colorize(im, color);
    h = imshow(im, argadd{:});
else
    h = imshow(impath, argadd{:});
end
% truesize(gca)
h.AlphaData = alpha;
if nargin < 4
    axes = h.Parent;
end
title(axes, name);