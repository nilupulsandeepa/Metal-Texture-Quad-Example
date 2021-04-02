//
//  Shader.metal
//  Metal-Texture-Quad-Example
//
//  Created by Nilupul Sandeepa on 2021-04-01.
//

#include <metal_stdlib>
using namespace metal;

struct VertexOut {
    float4 pos [[position]];
    float2 texCoords;
};

vertex VertexOut vertexFunction (constant float2 *vertices [[buffer(0)]],
                                 constant float2 *textureCoords [[buffer(1)]],
                                 uint vertexId [[vertex_id]]) {
    VertexOut vOut;
    vOut.pos = float4(vertices[vertexId].x, vertices[vertexId].y, 0.0, 1.0);
    vOut.texCoords = textureCoords[vertexId];
    return vOut;
}

fragment float4 fragmentFunction (VertexOut vIn [[stage_in]],
                                  texture2d<float> texture [[texture(0)]]
                                  ) {
    constexpr sampler colorSampler(mip_filter::linear, mag_filter::linear, min_filter::linear);
    float4 color = texture.sample(colorSampler, vIn.texCoords);
    return color;
}
