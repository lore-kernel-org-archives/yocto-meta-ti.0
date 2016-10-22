Return-Path: <comocomodore@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E484E00C9A; Sat, 22 Oct 2016 02:31:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (comocomodore[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.177 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39C8AE00C1C
	for <meta-ti@yoctoproject.org>; Sat, 22 Oct 2016 02:31:11 -0700 (PDT)
Received: by mail-qk0-f177.google.com with SMTP id o68so182829305qkf.3
	for <meta-ti@yoctoproject.org>; Sat, 22 Oct 2016 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=fdbviga5gZCpxN+n7LXcOugwI/AxfqKEkTdTAGyEByQ=;
	b=S0cNbG7rmkLOZ94ZIay8fgtfGzuQyP3Hhh9lKKeQqJB0NfFMpTLFpAW1d9MmwvoyI0
	mHFwefIhhImgos1d9Kf1RVjlf1Jf2v0pp+tmy4isAnTJm6tFgqCnpAglVuKRi7zpV5r3
	csokGpXKvfMfNtGFFBDs5Hq9nu35sksPy8aYB4Ir9KChkMmyjARyobnUbHfb+4k3j3Vh
	f/mMrVPJ6cOKQK7x375hclkl4qaVceZAI/sMAmK1+rrRGYFGly7JrGJDUD9API1PmTCr
	iJZdK53WdzvE0yXMahNCNeJMc4ZWS3f6SP6fXihnrDQoMmQ0R+iQRG7P1IQOVnQ6n+DS
	wV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fdbviga5gZCpxN+n7LXcOugwI/AxfqKEkTdTAGyEByQ=;
	b=brdq9L28WD5eAiJj/8rx3oobsoD3vW8ryjcB89ZVHjhhM4tzf5xCPzYQxxBXJ/RVpL
	E0KyXaoMueOP6MwhlcdpSSB67Hhz9NXKufPyn0t3Z7cXDLF80k7DH17xUpSNTOlVELZv
	0TCzjQoesk5t4ECpXod+G95ntpBJuyFK4Bgtvlp7Vm+7tEDbrZbxTLld4Hja9uacmaGK
	5OUExSSsFEdbFUye8FFqmyKfd/P3UyeP2jgkPxOu0tNK4rM+zoD8u2LX5tRqxlXC7ekh
	0EvZOD6hwCEqvTA3jx89BEzrsfYqac6kUwKJW3MbJDMT0SFcyu+vELr8A3dRIk2IV0Mo
	uphA==
X-Gm-Message-State: ABUngvest5hCgjxq+ne/Afm4KOUMkHhsRA26SbD0+7fvoP2MLGXOITPqm2r+33y22rCn3o3ycfYg52SwoiPCiw==
X-Received: by 10.55.99.202 with SMTP id x193mr6416381qkb.62.1477128670599;
	Sat, 22 Oct 2016 02:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.179.67 with HTTP; Sat, 22 Oct 2016 02:31:10 -0700 (PDT)
From: como comodore <comocomodore@gmail.com>
Date: Sat, 22 Oct 2016 11:31:10 +0200
Message-ID: <CAOsSiRT0U4=MF1A5anqsjV8z9+_8OG+eT8cs6EmjKdendB7D5Q@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: AM335x EGLFS gstreamer video extremely slow
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Oct 2016 09:31:14 -0000
Content-Type: multipart/alternative; boundary=94eb2c05b31cb2e16e053f70d177

--94eb2c05b31cb2e16e053f70d177
Content-Type: text/plain; charset=UTF-8

Hello,

I've just build a new system for Beaglebone Black with Yocto, meta-ti and
meta-qt5.
SGX drivers are loaded, Qt5 GLES2 examples are running fine with -platform
eglfs.
The only problem is that video files are extremely slow in eglfs (under 1
fps). I've opened some .avi file in Media Player Example from Qt and ran it
with GST_DEBUG=2 environment variable.

Here is the output:

xcb_connection_has_error() returned true

0:00:11.039354959 670 0x4be00 WARN pulse
pulsesink.c:615:gst_pulseringbuffer_open_device:<audiosink-actual-sink-pulse>
error: Failed to connect: Connection refused

0:00:11.071349168 670 0x4be00 WARN basesrc
gstbasesrc.c:3489:gst_base_src_start_complete:<source> pad not activated yet

0:00:11.077873501 670 0x4be00 WARN basesrc
gstbasesrc.c:3489:gst_base_src_start_complete:<source> pad not activated yet

0:00:11.159736793 670 0x1c6290 WARN alsa conf.c:4817:snd_config_expand:
alsalib error: Unknown parameters {AES0 0x02 AES1 0x82 AES2 0x00 AES3 0x02}

0:00:11.160655293 670 0x1c6290 WARN alsa pcm.c:2450:snd_pcm_open_noupdate:
alsalib error: Unknown PCM default:{AES0 0x02 AES1 0x82 AES2 0x00 AES3 0x02}

0:00:11.330111876 670 0xb1512ac0 ERROR h264parse
gsth264parse.c:2444:gst_h264_parse_set_caps: video/x-h264 caps with
codec_data but no stream-format=avc

0:00:15.296070960 670 0xb1705830 WARN basesink
gstbasesink.c:2854:gst_base_sink_is_too_late:<qgstvideorenderersink0>
warning: A lot of buffers are being dropped.

0:00:15.296832168 670 0xb1705830 WARN basesink
gstbasesink.c:2854:gst_base_sink_is_too_late:<qgstvideorenderersink0>
warning: There may be a timestamping problem, or this computer is too slow.

Warning: "A lot of buffers are being dropped."

Sound is playing fine. All GStreamer1.0 packages are installed. Any ideas
how to fix tis issue or playing video is not supported in EGLFS?

*gfx_check.sh *output*:*

WSEGL settings
[default]
WindowSystem=libpvrDRMWSEGL.so
DisableHWTQTextureUpload=1
DefaultPixelFormat=RGB565
------
ARM CPU information
processor    : 0
model name    : ARMv7 Processor rev 2 (v7l)
BogoMIPS    : 298.84
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpd32
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x3
CPU part    : 0xc08
CPU revision    : 2

Hardware    : Generic AM33XX (Flattened Device Tree)
Revision    : 0000
Serial        : 0000000000000000
------
SGX driver information
Version SGX_DDK sgxddk MAIN@3699939 (release) omap_linux
System Version String: SGX revision = 125
------
Framebuffer settings

mode "1280x720"
    geometry 1280 720 1280 720 16
    timings 0 0 0 0 0 0 0
    accel true
    rgba 5/11,6/5,5/0,0/0
endmode

Frame buffer device information:
    Name        :
    Address     : 0x9e900000
    Size        : 1843200
    Type        : PACKED PIXELS
    Visual      : TRUECOLOR
    XPanStep    : 1
    YPanStep    : 1
    YWrapStep   : 0
    LineLength  : 2560
    Accelerator : No
------
Rotation settings
0
------
Kernel Module information
Module                  Size  Used by
bluetooth             328754  4
bc_example              7326  0
snd_usb_audio         139564  0
snd_hwdep               6043  1 snd_usb_audio
snd_usbmidi_lib        20376  1 snd_usb_audio
snd_rawmidi            22968  1 snd_usbmidi_lib
usbtouchscreen          5791  0
usbhid                 20953  0
musb_dsps               8235  0
musb_hdrc              42682  1 musb_dsps
usbcore               194528  5
snd_usb_audio,musb_hdrc,usbtouchscreen,snd_usbmidi_lib,usbhid
pru_rproc              11646  0
pruss_intc              7163  1 pru_rproc
ecb                     1909  0
sha256_generic          9503  0
hmac                    2735  0
md5                     1897  0
sha1_generic            2557  0
snd_soc_simple_card     7648  0
sha1_arm_neon           6261  0
sha1_arm                3862  1 sha1_arm_neon
wkup_m3_ipc             7651  0
pvrsrvkm              403200  1 bc_example
wkup_m3_rproc           3599  1
pruss                  10892  1 pru_rproc
omap_aes_driver        19163  0
omap_sham              21513  0
remoteproc             26989  4 pruss,wkup_m3_rproc,pru_rproc,wkup_m3_ipc
virtio                  7678  1 remoteproc
virtio_ring            12175  1 remoteproc
omap_rng                4482  0
rng_core                7685  1 omap_rng
musb_am335x             1426  0
omap_wdt                4634  0
------
Boot settings
console=ttyO0,115200n8 consoleblank=0 root=PARTUUID=ac45843e-02 rw
rootfstype=ext4 rootwait
------
Linux Kernel version
Linux beaglebone 4.4.23-g4cd9d100e6 #2 PREEMPT Thu Oct 20 22:23:28 CEST
2016 armv7l armv7l armv7l GNU/Linux

Thanks,
Comodore

--94eb2c05b31cb2e16e053f70d177
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PHA+SGVsbG8sPC9wPg0KPHA+SSYjMzk7dmUganVzdCBidWlsZCBhIG5l
dyBzeXN0ZW0gZm9yIEJlYWdsZWJvbmUgQmxhY2sgd2l0aCBZb2N0bywgbWV0YS10aSBhbmQgbWV0
YS1xdDUuPGJyPlNHWCBkcml2ZXJzIGFyZSBsb2FkZWQsIFF0NSBHTEVTMiBleGFtcGxlcyBhcmUg
cnVubmluZyBmaW5lIHdpdGggLXBsYXRmb3JtIGVnbGZzLiA8YnI+VGhlDQogb25seSBwcm9ibGVt
IGlzIHRoYXQgdmlkZW8gZmlsZXMgYXJlIGV4dHJlbWVseSBzbG93IGluIGVnbGZzICh1bmRlciAx
IA0KZnBzKS4gSSYjMzk7dmUgb3BlbmVkIHNvbWUgLmF2aSBmaWxlIGluIE1lZGlhIFBsYXllciBF
eGFtcGxlIGZyb20gUXQgYW5kIHJhbg0KIGl0IHdpdGggR1NUX0RFQlVHPTIgZW52aXJvbm1lbnQg
dmFyaWFibGUuPC9wPg0KPHA+SGVyZSBpcyB0aGUgb3V0cHV0OjwvcD4NCjxwIHN0eWxlPSJ0ZXh0
LWluZGVudDowcHg7bWFyZ2luOjBweCI+eGNiX2Nvbm5lY3Rpb25faGFzX2Vycm9yKCkgcmV0dXJu
ZWQgdHJ1ZTwvcD4NCjxwIHN0eWxlPSJ0ZXh0LWluZGVudDowcHg7bWFyZ2luOjBweCI+MDowMDox
MS4wMzkzNTQ5NTkgNjcwIDB4NGJlMDAgDQpXQVJOIHB1bHNlIA0KcHVsc2VzaW5rLmM6NjE1Omdz
dF9wdWxzZXJpbmdidWZmZXJfb3Blbl9kZXZpY2U6Jmx0O2F1ZGlvc2luay1hY3R1YWwtc2luay1w
dWxzZSZndDsNCiBlcnJvcjogRmFpbGVkIHRvIGNvbm5lY3Q6IENvbm5lY3Rpb24gcmVmdXNlZDwv
cD4NCjxwIHN0eWxlPSJ0ZXh0LWluZGVudDowcHg7bWFyZ2luOjBweCI+MDowMDoxMS4wNzEzNDkx
NjggNjcwIDB4NGJlMDAgV0FSTiBiYXNlc3JjIGdzdGJhc2VzcmMuYzozNDg5OmdzdF9iYXNlX3Ny
Y19zdGFydF9jb21wbGV0ZTombHQ7c291cmNlJmd0OyBwYWQgbm90IGFjdGl2YXRlZCB5ZXQ8L3A+
DQo8cCBzdHlsZT0idGV4dC1pbmRlbnQ6MHB4O21hcmdpbjowcHgiPjA6MDA6MTEuMDc3ODczNTAx
IDY3MCAweDRiZTAwIFdBUk4gYmFzZXNyYyBnc3RiYXNlc3JjLmM6MzQ4OTpnc3RfYmFzZV9zcmNf
c3RhcnRfY29tcGxldGU6Jmx0O3NvdXJjZSZndDsgcGFkIG5vdCBhY3RpdmF0ZWQgeWV0PC9wPg0K
PHAgc3R5bGU9InRleHQtaW5kZW50OjBweDttYXJnaW46MHB4Ij4wOjAwOjExLjE1OTczNjc5MyA2
NzAgMHgxYzYyOTAgDQpXQVJOIGFsc2EgY29uZi5jOjQ4MTc6c25kX2NvbmZpZ19leHBhbmQ6IGFs
c2FsaWIgZXJyb3I6IFVua25vd24gDQpwYXJhbWV0ZXJzIHtBRVMwIDB4MDIgQUVTMSAweDgyIEFF
UzIgMHgwMCBBRVMzIDB4MDJ9PC9wPg0KPHAgc3R5bGU9InRleHQtaW5kZW50OjBweDttYXJnaW46
MHB4Ij4wOjAwOjExLjE2MDY1NTI5MyA2NzAgMHgxYzYyOTAgDQpXQVJOIGFsc2EgcGNtLmM6MjQ1
MDpzbmRfcGNtX29wZW5fbm91cGRhdGU6IGFsc2FsaWIgZXJyb3I6IFVua25vd24gUENNIA0KZGVm
YXVsdDp7QUVTMCAweDAyIEFFUzEgMHg4MiBBRVMyIDB4MDAgQUVTMyAweDAyfTwvcD4NCjxwIHN0
eWxlPSJ0ZXh0LWluZGVudDowcHg7bWFyZ2luOjBweCI+MDowMDoxMS4zMzAxMTE4NzYgNjcwIDB4
YjE1MTJhYzAgDQpFUlJPUiBoMjY0cGFyc2UgZ3N0aDI2NHBhcnNlLmM6MjQ0NDpnc3RfaDI2NF9w
YXJzZV9zZXRfY2FwczogDQp2aWRlby94LWgyNjQgY2FwcyB3aXRoIGNvZGVjX2RhdGEgYnV0IG5v
IHN0cmVhbS1mb3JtYXQ9YXZjPC9wPg0KPHAgc3R5bGU9InRleHQtaW5kZW50OjBweDttYXJnaW46
MHB4Ij4wOjAwOjE1LjI5NjA3MDk2MCA2NzAgMHhiMTcwNTgzMCANCldBUk4gYmFzZXNpbmsgDQpn
c3RiYXNlc2luay5jOjI4NTQ6Z3N0X2Jhc2Vfc2lua19pc190b29fbGF0ZTombHQ7cWdzdHZpZGVv
cmVuZGVyZXJzaW5rMCZndDsNCiB3YXJuaW5nOiBBIGxvdCBvZiBidWZmZXJzIGFyZSBiZWluZyBk
cm9wcGVkLjwvcD4NCjxwIHN0eWxlPSJ0ZXh0LWluZGVudDowcHg7bWFyZ2luOjBweCI+MDowMDox
NS4yOTY4MzIxNjggNjcwIDB4YjE3MDU4MzAgDQpXQVJOIGJhc2VzaW5rIA0KZ3N0YmFzZXNpbmsu
YzoyODU0OmdzdF9iYXNlX3NpbmtfaXNfdG9vX2xhdGU6Jmx0O3Fnc3R2aWRlb3JlbmRlcmVyc2lu
azAmZ3Q7DQogd2FybmluZzogVGhlcmUgbWF5IGJlIGEgdGltZXN0YW1waW5nIHByb2JsZW0sIG9y
IHRoaXMgY29tcHV0ZXIgaXMgdG9vIA0Kc2xvdy48L3A+DQo8cCBzdHlsZT0idGV4dC1pbmRlbnQ6
MHB4O21hcmdpbjowcHgiPldhcm5pbmc6ICZxdW90O0EgbG90IG9mIGJ1ZmZlcnMgYXJlIGJlaW5n
IGRyb3BwZWQuJnF1b3Q7PC9wPg0KPHA+DQo8L3A+PHA+U291bmQgaXMgcGxheWluZyBmaW5lLiBB
bGwgR1N0cmVhbWVyMS4wIHBhY2thZ2VzIGFyZSBpbnN0YWxsZWQuIA0KQW55IGlkZWFzIGhvdyB0
byBmaXggdGlzIGlzc3VlIG9yIHBsYXlpbmcgdmlkZW8gaXMgbm90IHN1cHBvcnRlZCBpbiANCkVH
TEZTPzwvcD4NCjxwPg0KPC9wPjxwPjxzdHJvbmc+Z2Z4X2NoZWNrLnNoIDwvc3Ryb25nPm91dHB1
dDxzdHJvbmc+Ojwvc3Ryb25nPjwvcD4NCjxwPldTRUdMIHNldHRpbmdzPGJyPltkZWZhdWx0XTxi
cj5XaW5kb3dTeXN0ZW09bGlicHZyRFJNV1NFR0wuc288YnI+RGlzYWJsZUhXVFFUZXh0dXJlVXBs
b2FkPTE8YnI+RGVmYXVsdFBpeGVsRm9ybWF0PVJHQjU2NTxicj4tLS0tLS08YnI+QVJNIENQVSBp
bmZvcm1hdGlvbjxicj5wcm9jZXNzb3LCoMKgIMKgOiAwPGJyPm1vZGVsIG5hbWXCoMKgIMKgOiBB
Uk12NyBQcm9jZXNzb3IgcmV2IDIgKHY3bCk8YnI+Qm9nb01JUFPCoMKgIMKgOiAyOTguODQ8YnI+
RmVhdHVyZXPCoMKgIMKgOiBoYWxmIHRodW1iIGZhc3RtdWx0IHZmcCBlZHNwIG5lb24gdmZwdjMg
dGxzIHZmcGQzMiA8YnI+Q1BVIGltcGxlbWVudGVywqDCoCDCoDogMHg0MTxicj5DUFUgYXJjaGl0
ZWN0dXJlOiA3PGJyPkNQVSB2YXJpYW50wqDCoCDCoDogMHgzPGJyPkNQVSBwYXJ0wqDCoCDCoDog
MHhjMDg8YnI+Q1BVIHJldmlzaW9uwqDCoCDCoDogMjxicj48YnI+SGFyZHdhcmXCoMKgIMKgOiBH
ZW5lcmljIEFNMzNYWCAoRmxhdHRlbmVkIERldmljZSBUcmVlKTxicj5SZXZpc2lvbsKgwqAgwqA6
IDAwMDA8YnI+U2VyaWFswqDCoCDCoMKgwqAgwqA6IDAwMDAwMDAwMDAwMDAwMDA8YnI+LS0tLS0t
PGJyPlNHWCBkcml2ZXIgaW5mb3JtYXRpb248YnI+VmVyc2lvbiBTR1hfRERLIHNneGRkayBNQUlO
QDM2OTk5MzkgKHJlbGVhc2UpIG9tYXBfbGludXg8YnI+U3lzdGVtIFZlcnNpb24gU3RyaW5nOiBT
R1ggcmV2aXNpb24gPSAxMjU8YnI+LS0tLS0tPGJyPkZyYW1lYnVmZmVyIHNldHRpbmdzPGJyPjxi
cj5tb2RlICZxdW90OzEyODB4NzIwJnF1b3Q7PGJyPsKgwqDCoCBnZW9tZXRyeSAxMjgwIDcyMCAx
MjgwIDcyMCAxNjxicj7CoMKgwqAgdGltaW5ncyAwIDAgMCAwIDAgMCAwPGJyPsKgwqDCoCBhY2Nl
bCB0cnVlPGJyPsKgwqDCoCByZ2JhIDUvMTEsNi81LDUvMCwwLzA8YnI+ZW5kbW9kZTxicj48YnI+
RnJhbWUgYnVmZmVyIGRldmljZSBpbmZvcm1hdGlvbjo8YnI+wqDCoMKgIE5hbWXCoMKgwqDCoMKg
wqDCoCA6IDxicj7CoMKgwqAgQWRkcmVzc8KgwqDCoMKgIDogMHg5ZTkwMDAwMDxicj7CoMKgwqAg
U2l6ZcKgwqDCoMKgwqDCoMKgIDogMTg0MzIwMDxicj7CoMKgwqAgVHlwZcKgwqDCoMKgwqDCoMKg
IDogUEFDS0VEIFBJWEVMUzxicj7CoMKgwqAgVmlzdWFswqDCoMKgwqDCoCA6IFRSVUVDT0xPUjxi
cj7CoMKgwqAgWFBhblN0ZXDCoMKgwqAgOiAxPGJyPsKgwqDCoCBZUGFuU3RlcMKgwqDCoCA6IDE8
YnI+wqDCoMKgIFlXcmFwU3RlcMKgwqAgOiAwPGJyPsKgwqDCoCBMaW5lTGVuZ3RowqAgOiAyNTYw
PGJyPsKgwqDCoCBBY2NlbGVyYXRvciA6IE5vPGJyPi0tLS0tLTxicj5Sb3RhdGlvbiBzZXR0aW5n
czxicj4wPGJyPi0tLS0tLTxicj5LZXJuZWwgTW9kdWxlIGluZm9ybWF0aW9uPGJyPk1vZHVsZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU2l6ZcKgIFVzZWQgYnk8YnI+Ymx1ZXRv
b3RowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDMyODc1NMKgIDQ8YnI+YmNfZXhhbXBsZcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDczMjbCoCAwPGJyPnNuZF91c2JfYXVkaW/CoMKgwqDCoMKg
wqDCoMKgIDEzOTU2NMKgIDA8YnI+c25kX2h3ZGVwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA2MDQzwqAgMSBzbmRfdXNiX2F1ZGlvPGJyPnNuZF91c2JtaWRpX2xpYsKgwqDCoMKgwqDCoMKg
IDIwMzc2wqAgMSBzbmRfdXNiX2F1ZGlvPGJyPnNuZF9yYXdtaWRpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAyMjk2OMKgIDEgc25kX3VzYm1pZGlfbGliPGJyPnVzYnRvdWNoc2NyZWVuwqDCoMKgwqDC
oMKgwqDCoMKgIDU3OTHCoCAwPGJyPnVzYmhpZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDIwOTUzwqAgMDxicj5tdXNiX2RzcHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDgy
MzXCoCAwPGJyPm11c2JfaGRyY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDQyNjgywqAgMSBt
dXNiX2RzcHM8YnI+dXNiY29yZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTk0NTI4wqAg
NSBzbmRfdXNiX2F1ZGlvLG11c2JfaGRyYyx1c2J0b3VjaHNjcmVlbixzbmRfdXNibWlkaV9saWIs
dXNiaGlkPGJyPnBydV9ycHJvY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDExNjQ2wqAgMDxi
cj5wcnVzc19pbnRjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNzE2M8KgIDEgcHJ1X3Jwcm9j
PGJyPmVjYsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTkwOcKgIDA8
YnI+c2hhMjU2X2dlbmVyaWPCoMKgwqDCoMKgwqDCoMKgwqAgOTUwM8KgIDA8YnI+aG1hY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDI3MzXCoCAwPGJyPm1kNcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTg5N8KgIDA8YnI+c2hhMV9nZW5lcmlj
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyNTU3wqAgMDxicj5zbmRfc29jX3NpbXBsZV9jYXJkwqDC
oMKgwqAgNzY0OMKgIDA8YnI+c2hhMV9hcm1fbmVvbsKgwqDCoMKgwqDCoMKgwqDCoMKgIDYyNjHC
oCAwPGJyPnNoYTFfYXJtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDM4NjLCoCAxIHNo
YTFfYXJtX25lb248YnI+d2t1cF9tM19pcGPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNzY1McKg
IDA8YnI+cHZyc3J2a23CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0MDMyMDDCoCAxIGJjX2V4
YW1wbGU8YnI+d2t1cF9tM19ycHJvY8KgwqDCoMKgwqDCoMKgwqDCoMKgIDM1OTnCoCAxPGJyPnBy
dXNzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMDg5MsKgIDEgcHJ1X3Jwcm9j
PGJyPm9tYXBfYWVzX2RyaXZlcsKgwqDCoMKgwqDCoMKgIDE5MTYzwqAgMDxicj5vbWFwX3NoYW3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyMTUxM8KgIDA8YnI+cmVtb3RlcHJvY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAyNjk4OcKgIDQgcHJ1c3Msd2t1cF9tM19ycHJvYyxwcnVfcnByb2Ms
d2t1cF9tM19pcGM8YnI+dmlydGlvwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA3
Njc4wqAgMSByZW1vdGVwcm9jPGJyPnZpcnRpb19yaW5nwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAx
MjE3NcKgIDEgcmVtb3RlcHJvYzxicj5vbWFwX3JuZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA0NDgywqAgMDxicj5ybmdfY29yZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA3
Njg1wqAgMSBvbWFwX3JuZzxicj5tdXNiX2FtMzM1eMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAx
NDI2wqAgMDxicj5vbWFwX3dkdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0NjM0wqAg
MDxicj4tLS0tLS08YnI+Qm9vdCBzZXR0aW5nczxicj5jb25zb2xlPXR0eU8wLDExNTIwMG44IGNv
bnNvbGVibGFuaz0wIHJvb3Q9UEFSVFVVSUQ9YWM0NTg0M2UtMDIgcncgcm9vdGZzdHlwZT1leHQ0
IHJvb3R3YWl0PGJyPi0tLS0tLTxicj5MaW51eCBLZXJuZWwgdmVyc2lvbjxicj5MaW51eCBiZWFn
bGVib25lIDQuNC4yMy1nNGNkOWQxMDBlNiAjMiBQUkVFTVBUIFRodSBPY3QgMjAgMjI6MjM6Mjgg
Q0VTVCAyMDE2IGFybXY3bCBhcm12N2wgYXJtdjdsIEdOVS9MaW51eDwvcD4NCjxwPg0KPC9wPjxw
PlRoYW5rcyw8YnI+Q29tb2RvcmU8L3A+PC9kaXY+DQo=

--94eb2c05b31cb2e16e053f70d177--
