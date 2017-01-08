import std.file;
import msgpack;

struct S { int x; float y; string z; }

void main()
{
    S input = S(10, 25.5, "message");

    // serialize data
    ubyte[] inData = pack(input);

    // write data to a file
    write("file.dat", inData);

    // read data from a file
    ubyte[] outData = cast(ubyte[])read("file.dat");

    // unserialize the data
    S target = outData.unpack!S();

    // verify data is the same
    assert(target.x == input.x);
    assert(target.y == input.y);
    assert(target.z == input.z);
}