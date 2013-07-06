Return-Path: <sudhangathan@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2CBDE0155E
	for <meta-ti@yoctoproject.org>; Fri,  5 Jul 2013 21:16:36 -0700 (PDT)
Received: by mail-qc0-f180.google.com with SMTP id a1so1509303qcx.25
	for <meta-ti@yoctoproject.org>; Fri, 05 Jul 2013 21:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=HnaGTaTW05VZoP4MayMD5y3L19fqbwG/zcnJa1WrFVg=;
	b=oq6lS8VDTh3O8vcK1JN0LZa3fJ4EW9v7AoEI1MRkWnFkuhdGozHMQGdFnWgBQtsYXT
	14GhMgYVMU9MOwJ019csRGpVr7Bpmbon61CALxqz6Z5pOmJARTUgPRO774j2/sadDTpV
	xr/QfEnAXw9505XGH1eOqk71EhqvaubnkD8TORkxSkd81Fk7hpZRITR/9Ei/NkhGncQC
	PZEN1v/LrzEqv/vzJwy6PEufU4I9kBZO8O7W5S9TjpvvicCJYyyYdDw146jNqKRcR/R4
	iQplQxEPjZayM2bBcuz1F5P1LvgNrR/Z+Mk2DysJ3ndNtPGSEsL+X9/p/dM7MOT+pyxT
	cH7Q==
X-Received: by 10.49.101.74 with SMTP id fe10mr7674387qeb.11.1373084196238;
	Fri, 05 Jul 2013 21:16:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.95.9 with HTTP; Fri, 5 Jul 2013 21:16:16 -0700 (PDT)
From: Sudhangathan B S <sudhangathan@gmail.com>
Date: Sat, 6 Jul 2013 09:46:16 +0530
Message-ID: <CAGX3a9_Ykh8bUQEb3KVFah+rpHck=2V8bsjVS2yyy3_RAWhamA@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: booting 2.6.32 kernel and rootfs
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
X-List-Received-Date: Sat, 06 Jul 2013 04:16:41 -0000
Content-Type: multipart/alternative; boundary=001a11c2c6cec37c3e04e0d013d8

--001a11c2c6cec37c3e04e0d013d8
Content-Type: text/plain; charset=ISO-8859-1

On my way to integrate Leopard imaging camera drivers into the beagle board
image, I successfully built a minimal image with necessary camera drivers
in the image, this is all after I integrated meta-ti layer with yocto.
I finally put the files in the card and powered up the beagle board.

This is what i'm getting..

U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)

OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
OMAP3 Beagle board + LPDDR/NAND
I2C:   ready
DRAM:  512 MiB
WARNING: Caches not enabled
NAND:  0 MiB
MMC:   OMAP SD/MMC: 0
*** Warning - readenv() failed, using default environment

In:    serial
Out:   serial
Err:   serial
Beagle xM Rev C
No EEPROM on expansion board
No EEPROM on expansion board
Die ID #689000029ff80000016842c81202f014
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0
The user button is currently NOT pressed.
SD/MMC found on device 0
reading uEnv.txt

** Unable to read "uEnv.txt" from mmc 0:1 **
Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
3148568 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 80200000 ...
   Image Name:   Linux-2.6.32
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3148504 Bytes = 3 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing
Linux............................................................................................................................................................................................................
done, booting the kernel.

AND NOTHING AFTER THIS... Any clue how to proceed..?

I posted in this mailing list, just because i'm using the meta-ti layer.
Please do let me know if there is another one..!

Best,
---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------

--001a11c2c6cec37c3e04e0d013d8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On my way to integrate Leopard imaging camera drivers into=
 the beagle board image, I successfully built a minimal image with necessar=
y camera drivers in the image, this is all after I integrated meta-ti layer=
 with yocto.<div style>

I finally put the files in the card and powered up the beagle board.</div><=
div style><br></div><div style>This is what i&#39;m getting..</div><div sty=
le><br></div><div style><div>U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 0=
5 2013 - 20:38:26)</div>

<div>Texas Instruments Revision detection unimplemented</div><div>OMAP SD/M=
MC: 0</div><div>reading u-boot.img</div><div>reading u-boot.img</div><div><=
br></div><div><br></div><div>U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 20=
13 - 20:38:26)</div>

<div><br></div><div>OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Cl=
ock 1 Ghz</div><div>OMAP3 Beagle board + LPDDR/NAND</div><div>I2C: =A0 read=
y</div><div>DRAM: =A0512 MiB</div><div>WARNING: Caches not enabled</div><di=
v>

NAND: =A00 MiB</div><div>MMC: =A0 OMAP SD/MMC: 0</div><div>*** Warning - re=
adenv() failed, using default environment</div><div><br></div><div>In: =A0 =
=A0serial</div><div>Out: =A0 serial</div><div>Err: =A0 serial</div><div>Bea=
gle xM Rev C</div>

<div>No EEPROM on expansion board</div><div>No EEPROM on expansion board</d=
iv><div>Die ID #689000029ff80000016842c81202f014</div><div>Net: =A0 Net Ini=
tialization Skipped</div><div>No ethernet found.</div><div>Hit any key to s=
top autoboot: =A00=A0</div>

<div>The user button is currently NOT pressed.</div><div>SD/MMC found on de=
vice 0</div><div>reading uEnv.txt</div><div><br></div><div>** Unable to rea=
d &quot;uEnv.txt&quot; from mmc 0:1 **</div><div>Loading file &quot;/boot/u=
Image&quot; from mmc device 0:2 (xxa2)</div>

<div>3148568 bytes read</div><div>Booting from mmc ...</div><div>## Booting=
 kernel from Legacy Image at 80200000 ...</div><div>=A0 =A0Image Name: =A0 =
Linux-2.6.32</div><div>=A0 =A0Image Type: =A0 ARM Linux Kernel Image (uncom=
pressed)</div>

<div>=A0 =A0Data Size: =A0 =A03148504 Bytes =3D 3 MiB</div><div>=A0 =A0Load=
 Address: 80008000</div><div>=A0 =A0Entry Point: =A080008000</div><div>=A0 =
=A0Verifying Checksum ... OK</div><div>=A0 =A0Loading Kernel Image ... OK</=
div><div>OK</div><div><br>

</div><div>Starting kernel ...</div><div><br></div><div>Uncompressing Linux=
...........................................................................=
...........................................................................=
...................................................... done, booting the ke=
rnel.</div>

<div><br></div><div style>AND NOTHING AFTER THIS... Any clue how to proceed=
..?=A0</div><div style><br></div><div style>I posted in this mailing list, =
just because i&#39;m using the meta-ti layer. Please do let me know if ther=
e is another one..!</div>

</div><div><br></div><div>Best,<br clear=3D"all"><div>---------------------=
------------<br>Sudhangathan BS<br>Ph:(+91) 9731-905-205<br>---------------=
------------------</div>
</div></div>

--001a11c2c6cec37c3e04e0d013d8--
