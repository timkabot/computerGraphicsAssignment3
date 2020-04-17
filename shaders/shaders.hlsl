cbuffer ConstantBuffer: register(b0)
{
	float4x4 mwpMatrix;
}

struct PSInput
{
	float4 position : SV_POSITION;
	float4 color : COLOR;
};

PSInput VSMain(float4 position : POSITION, float4 color : COLOR)
{
	PSInput result;


	result.position = mul(mwpMatrix, position);
	result.color = color;

	return result;
}

float4 PSMain(PSInput input) : SV_TARGET
{
	return input.color;
}
