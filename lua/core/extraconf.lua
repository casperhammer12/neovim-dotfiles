local ext = require('userrc').confs

if ext ~= nil then
    for key,value in pairs(ext) do
        if value ~= nil then
            value()
        end
    end
end
