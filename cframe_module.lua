local function CreateCFrame(a, b, c, d, e, f, g, h, i, j, k, l)

    if a and b and c then
        if d and e and f and g and h and i and j and k and l then
            local cframe = {
                components = {a, b, c, d, e, f, g, h, i, j, k, l}
            }
        else
            local cframe = {
                components = {a, b, c, 1, 0, 0, 0, 1, 0, 0, 0, -1}
            }
        end
    else
        local cframe = {
            components = {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, -1}
        }
    end

    local function cframe:GetComponents()
        return cframe["components"][1], cframe["components"][2], cframe["components"][3], cframe["components"][4], cframe["components"][5], cframe["components"][6], cframe["components"][7], cframe["components"][8], cframe["components"][9], cframe["components"][10], cframe["components"][11], cframe["components"][12]
    end

    local function cframe:Multiply(cframe1, cframe2)
        local x1, y1, z1, a11, a21, a31, a12, a22, a32, a13, a23, a33 = cframe1:GetComponents()
        local x2, y2, z2, b11, b21, b31, b12, b22, b32, b13, b23, b33 = cframe2:GetComponents()
        return CreateCFrame(a11 * b11 + a12 * b21 + a13 * b31,
                a21 * b11 + a22 * b21 + a23 * b31,
                a31 * b11 + a32 * b21 + a33 * b31,
                a11 * b12 + a12 * b22 + a13 * b32,
                a21 * b12 + a22 * b22 + a23 * b32,
                a31 * b12 + a32 * b22 + a33 * b32,
                a11 * b13 + a12 * b23 + a13 * b33,
                a21 * b13 + a22 * b23 + a23 * b33,
                a31 * b13 + a32 * b23 + a33 * b33,
                a11 * x2 + a12 * y2 + a13 * z2 + x1,
                a21 * x2 + a22 * y2 + a23 * z2 + y1,
                a31 * x2 + a32 * y2 + a33 * z2 + z1}
    end

    return cframe
end

local function CreateAngleCFrame(x, y, z)
    -- Angles are applied in z, y, x order in regular cframes, so that will be used here.
    local temp_components = {1, 0, 0, 0, 1, 0, 0, 0, -1}
    local new_components = {1, 0, 0, 0, 1, 0, 0, 0, -1}

    -- z axis transformation
    -- right vector
    new_components[1] = temp_components[1] * math.cos(z) - temp_components[2] * math.sin(z)
    new_components[2] = temp_components[1] * math.sin(z) + temp_components[2] * math.cos(z)
    -- up vector
    new_components[4] = temp_components[4] * math.cos(z) - temp_components[5] * math.sin(z)
    new_components[5] = temp_components[4] * math.sin(z) + temp_components[5] * math.cos(z)
    -- look vector
    new_components[7] = temp_components[7] * math.cos(z) - temp_components[8] * math.sin(z)
    new_components[8] = temp_components[7] * math.sin(z) + temp_components[8] * math.cos(z)

    temp_components = new_components

    -- y axis transformation
    -- y becomes negative z
    -- z becomes y
    -- rotate z and x
    
    new_components[1] = temp_components[1] * math.cos(y) + temp_components[3] * math.sin(y)
    new_components[3] = temp_components[1] * math.sin(y) + temp_components[3] * math.cos(y)

    new_components[4] = temp_components[4] * math.cos(y) + temp_components[6] * math.sin(y)
    new_components[6] = temp_components[4] * math.sin(y) + temp_components[6] * math.cos(y)

    new_components[7] = temp_components[7] * math.cos(y) + temp_components[9] * math.sin(y)
    new_components[9] = temp_components[7] * math.sin(y) + temp_components[9] * math.cos(y)

    temp_components = new_components

    -- x axis transformation
    -- z becomes negative x
    -- x becomes z
    -- rotate z and y

    new_components[3] = -temp_components[3] * math.cos(x) - temp_components[2] * math.sin(x)
    new_components[2] = temp_components[3] * math.sin(x) + temp_components[2] * math.cos(x)
    
    new_components[6] = -temp_components[6] * math.cos(x) - temp_components[5] * math.sin(x)
    new_components[5] = temp_components[6] * math.sin(x) + temp_components[5] * math.cos(x)

    new_components[9] = -temp_components[9] * math.cos(x) - temp_components[8] * math.sin(x)
    new_components[8] = temp_components[9] * math.sin(x) + temp_components[8] * math.cos(x)
    
    return CreateCFrame(0, 0, 0, new_components[1], new_components[2], new_components[3], new_components[4], new_components[5], new_components[6], new_components[7], new_components[8], new_components[9])
end
