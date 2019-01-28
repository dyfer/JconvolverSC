//how to use Jconvolver class
//1. create configuration file
//2. create an instance (starts processing)

//creating config file from folder of files
//part size that equls to jack period size gives no latency supposedly
//maxSize must be larger than numFrames of the kernel
// autoConnect.. if simple number, will connect starting on that channel (with respective number of ins/outs), if array, will map to specified input...
//not providing configFilePath creates the file in the same folder as kernels and assumes relative paths to kernels
//num ins and outs equals number of found kernels, also uses 1:1 matrix, assumes single channel kernels,

// ~path = "~/Documents/SoundLabBrain/SoundLabKernelsNew/48000/decor".standardizePath;
// ~path = "/Users/admin/Documents/Sound_Labs/117/Decoder/117_Decoder_Testing/48000/decor/"
// ~path = "/Library/jconvoler/config-files/"
// ~path = "/Library/jconvoler/config-files/"
~path = "/Volumes/data/Dokumenty/2012-2013/dxSoundLab/SoundLabKernels113/48000/"
~path = "/Volumes/data/Dokumenty/2012-2013/dxSoundLab/SoundLabKernels113/96000/moderate/k_24_1.365w_18c_5b_0.0t/"
// for osx
Jconvolver.jackScOutNameDefault = "scsynth:out"
Jconvolver.executablePath_("/usr/local/bin/jconvolver")

Jconvolver.createSimpleConfigFileFromFolder(kernelFolderPath: ~path, partitionSize: 512, maxKernelSize: 240000, matchFileName: "*.wav", autoConnectToScChannels: 2, autoConnectToSoundcardChannels: 0);

// assumes scsynth is running to make Jack connections
s.options.device_("JackRouter");
s.options.maxSynthDefs_(2048);
s.reboot;

j = Jconvolver.newFromFolder(~path); //we don't care for compensating latency (cutting kernels...) so that's it

//now you can look in qjackctl at the connections

// test with sound from SC...
x.free; x = play({ Decay.ar(Impulse.ar(XLine.kr(1,50,20), 0.25), 0.2, PinkNoise.ar, 0).dup(2) }, outbus: 1);
s.meter
x.free

//when done:
j.free;

//uses JACK quark
JSC

JACK

Quarks.gui

SCJConnection.prepend = "/usr/local/bin/";

SCJConnection.getconnections

SCJConnection.connections.keys