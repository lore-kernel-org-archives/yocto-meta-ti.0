Return-Path: <leo.e.meza@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52E35E00A16; Thu, 13 Sep 2018 13:05:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (leo.e.meza[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77F97E0093B
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 13:05:29 -0700 (PDT)
Received: by mail-oi0-f46.google.com with SMTP id c190-v6so10665557oig.6
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=/JdgTG6PxfiGq1FXEi6L3TIoooN/zNO5bNbspOWWMiU=;
	b=JdflASsgBNJ81yFmEe0kKmZsJ2WzNefQAzBffbyQKWuhChZ1J/vWuGHEdCpidkfD1Z
	jxF2YcFYh//YSy+rjrGKGm2sNlbvLD2ajt/0r7j3ddMCxYr4dTPCR/7LO0cPEzAJPUmZ
	aOvDifyl6KxhalY4QgewQQLEMDZjh98rTeQ6I/g68wvl4bin4OdQ9QjjkwE7WwHoiJoc
	dqC2fTLaVIqnwyVwfZqMlsLkfYJ06fdCKIb6JDViIw4g/8i9nP0eji11wGgznrUKKxms
	/oV4ZsRxEWdMjvPoJuS0yn6HLovvG7pVpOwCBMkbYVUqivvvAvTDNir715rglAA0m10m
	w3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=/JdgTG6PxfiGq1FXEi6L3TIoooN/zNO5bNbspOWWMiU=;
	b=DustA4DJyg6TCtEeSnvjq2sZ817myk9nhPIJuYqb55zBR/gvg8tPmCmO1RJ5XWqxrb
	rmvy2+XJqcaut13Rhm0tF+qKDsAqi/S4qF7rSyONKRp8ExxKPBcMQRf7kdxSzGoBmJ7G
	/a2kiQomDyq/SyyHO06DgUwoBm6v7/VoXlv4kY3TJAHv4xhabYF2iZT8qEaOXlm04KiD
	Nc8RyFFCmHtleKzDIqb6eIYhPmG8CzoabzRBZwIibyyjzNlOPaRGGnsk+ktVYuQhTaz/
	Hopc+9PVOMVf+pusCvy9F2iTf0p/bYrNikSSBTxAtUplz9UDmD5qGXcAyYLS0cejNlMj
	HAiQ==
X-Gm-Message-State: APzg51C+4JM/iKlUqKWGPUSOq7YpqRLXJ9lokJ3nIsyH11xchmh3LvCX
	VwX8ADqt0ttFn9WS+Fe4UyGGKW/PVdzHh29lSoCAW3dS
X-Google-Smtp-Source: ANB0VdbdXAdoO9aoHHIPlq74sp9tgeWZtkKz9PsD3lrIbl/TfwwRZf8YnqClT5fCNPEvTbIrl6eey8T5zTF6AOeGj5g=
X-Received: by 2002:aca:1112:: with SMTP id 18-v6mr7815358oir.79.1536869128602;
	Thu, 13 Sep 2018 13:05:28 -0700 (PDT)
MIME-Version: 1.0
From: Leo Meza <leo.e.meza@gmail.com>
Date: Thu, 13 Sep 2018 13:05:17 -0700
Message-ID: <CADrbpyy84sPcVX2ZdpNrkdyakucozgn-5VSXsvCFH9GHM4B+Nw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: musb_hdrc driver and "Qualcomm, Inc. Gobi Wireless Modem"
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
X-List-Received-Date: Thu, 13 Sep 2018 20:05:30 -0000
Content-Type: multipart/alternative; boundary="0000000000007a08b50575c63a03"

--0000000000007a08b50575c63a03
Content-Type: text/plain; charset="UTF-8"

I'm trying to get my target to recognize a USB-connected 4G LTE modem on
powerup....

My target is a beaglebone black (AM335x) using meta-ti "rocko" branch and
I've added a kernel config fragment with the following:
CONFIG_USB_NET_QMI_WWAN=m

My distro.conf file removes the usbgadget and usbhost features:
MACHINE_FEATURES_remove += " alsa usbgadget usbhost vfat"

So far, when I power up the target, it looks as though the musb-hdrc driver
is attaching to the USB Modem:
[   15.467735] usbcore: registered new interface driver usbfs
[   15.475891] am335x-phy-driver 47401300.usb-phy: 47401300.usb-phy supply
vcc not found, using dummy regulator
[   15.483431] am335x-phy-driver 47401b00.usb-phy: 47401b00.usb-phy supply
vcc not found, using dummy regulator
[   15.625497] pruss 4a300000.pruss: creating PRU cores and other child
platform devices
[   15.639846] usbcore: registered new interface driver hub
[   15.718440] usbcore: registered new device driver usb
[   15.831900] remoteproc remoteproc1: 4a334000.pru is available
[   15.837767] pru-rproc 4a334000.pru: PRU rproc node
/ocp/pruss_soc_bus@4a326004/pruss@0/pru@34000 probed successfully
[   15.867980] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
[   15.868016] musb-hdrc musb-hdrc.1: new USB bus registered, assigned bus
number 1
[   15.883041] hub 1-0:1.0: USB hub found
[   15.883105] hub 1-0:1.0: 1 port detected
[   15.961998] remoteproc remoteproc2: 4a338000.pru is available
[   15.967859] pru-rproc 4a338000.pru: PRU rproc node
/ocp/pruss_soc_bus@4a326004/pruss@0/pru@38000 probed successfully
[   16.320431] usb 1-1: new high-speed USB device number 2 using musb-hdrc
[   53.040523] random: crng init done
[   53.044007] random: 7 urandom warning(s) missed due to ratelimiting

When I use "lsusb" I see this, and I'm unable to use the modem:
Bus 001 Device 002: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL
mode)

LSMOD shows this:
root@target:~# lsmod
Module                  Size  Used by
pru_rproc              20480  0
musb_dsps              20480  0
pruss_intc             16384  1 pru_rproc
musb_hdrc              98304  1 musb_dsps
udc_core               28672  1 musb_hdrc
pruss                  16384  1 pru_rproc
phy_am335x             16384  2
usbcore               204800  1 musb_hdrc
phy_generic            16384  1 phy_am335x
usb_common             16384  5
phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore
phy_am335x_control     16384  1 phy_am335x
pm33xx                 16384  0
snd_soc_simple_card    16384  0
snd_soc_simple_card_utils    16384  1 snd_soc_simple_card
wkup_m3_rproc          16384  1
wkup_m3_ipc            16384  1 pm33xx
remoteproc             40960  3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc
omap_aes_driver        24576  0
crypto_engine          16384  1 omap_aes_driver
omap_crypto            16384  1 omap_aes_driver
omap_sham              28672  0
ti_emif_sram           16384  1 pm33xx
pruss_soc_bus          16384  0
rtc_omap               20480  2
musb_am335x            16384  0
omap_wdt               16384  0
at24                   16384  0
sch_fq_codel           20480  1

However, if I don't plug in the device until AFTER the system boots and I
login, then I see the cdc_wdm driver is gets registered and the cdc-wdm0
device is created:

root@target:~# [   60.630559] usb 1-1: new high-speed USB device number 2
using musb-hdrc
[   60.993246] usbcore: registered new interface driver cdc_wdm
[   61.013436] qmi_wwan 1-1:1.2: cdc-wdm0: USB WDM device
[   61.038279] qmi_wwan 1-1:1.2 wwan0: register 'qmi_wwan' at
usb-musb-hdrc.1-1, WWAN/QMI device, be:ce:e7:34:15:d8
[   61.059967] usbcore: registered new interface driver qmi_wwan

LSUSB shows me this, and I'm able to use the modem:

root@target:~# lsusb
Bus 001 Device 002: ID 1bc7:1040 Telit Wireless Solutions

LSMOD shows this:

root@target:~# lsmod
Module                  Size  Used by
qmi_wwan               28672  0
cdc_wdm                20480  1 qmi_wwan
usbnet                 32768  1 qmi_wwan
pru_rproc              20480  0
pruss_intc             16384  1 pru_rproc
pruss                  16384  1 pru_rproc
musb_dsps              20480  0
musb_hdrc              98304  1 musb_dsps
udc_core               28672  1 musb_hdrc
usbcore               204800  4 usbnet,qmi_wwan,cdc_wdm,musb_hdrc
phy_am335x             1[   78.790878] random: crng init done
[   78.799335] random: 7 urandom warning(s) missed due to ratelimiting
6384  2
phy_generic            16384  1 phy_am335x
usb_common             16384  5
phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore
phy_am335x_control     16384  1 phy_am335x
pm33xx                 16384  0
snd_soc_simple_card    16384  0
snd_soc_simple_card_utils    16384  1 snd_soc_simple_card
wkup_m3_ipc            16384  1 pm33xx
wkup_m3_rproc          16384  1
remoteproc             40960  3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc
omap_aes_driver        24576  0
crypto_engine          16384  1 omap_aes_driver
omap_crypto            16384  1 omap_aes_driver
omap_sham              28672  0
pruss_soc_bus          16384  0
ti_emif_sram           16384  1 pm33xx
rtc_omap               20480  2
at24                   16384  0
omap_wdt               16384  0
musb_am335x            16384  0
sch_fq_codel           20480  1

And pointers on how I can get the drivers (cdc_wdm, qmi_wwan, etc) setup so
the USB modem is recognized at powerup instead of having to plug in the
device after powerup would be greatly appreciated.

Thanks in advance!
-Leo

--0000000000007a08b50575c63a03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div>I&#39;m trying to get my target to recognize a USB-connected 4G LTE=
 modem on powerup....</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">My t=
arget is a beaglebone black (AM335x) using meta-ti &quot;rocko&quot; branch=
 and I&#39;ve added a kernel config fragment with the following:<div>CONFIG=
_USB_NET_QMI_WWAN=3Dm<br></div><div><br></div><div>My distro.conf file remo=
ves the usbgadget and usbhost features:</div><div>MACHINE_FEATURES_remove +=
=3D &quot; alsa usbgadget usbhost vfat&quot;<br></div><div><br></div><div>S=
o far, when I power up the target, it looks as though the musb-hdrc driver =
is attaching to the USB Modem:</div><div><div>[=C2=A0 =C2=A015.467735] usbc=
ore: registered new interface driver usbfs</div><div>[=C2=A0 =C2=A015.47589=
1] am335x-phy-driver 47401300.usb-phy: 47401300.usb-phy supply vcc not foun=
d, using dummy regulator</div><div>[=C2=A0 =C2=A015.483431] am335x-phy-driv=
er 47401b00.usb-phy: 47401b00.usb-phy supply vcc not found, using dummy reg=
ulator</div><div>[=C2=A0 =C2=A015.625497] pruss 4a300000.pruss: creating PR=
U cores and other child platform devices</div><div>[=C2=A0 =C2=A015.639846]=
 usbcore: registered new interface driver hub</div><div>[=C2=A0 =C2=A015.71=
8440] usbcore: registered new device driver usb</div><div>[=C2=A0 =C2=A015.=
831900] remoteproc remoteproc1: 4a334000.pru is available</div><div>[=C2=A0=
 =C2=A015.837767] pru-rproc 4a334000.pru: PRU rproc node /ocp/pruss_soc_bus=
@4a326004/pruss@0/pru@34000 probed successfully</div><div>[=C2=A0 =C2=A015.=
867980] musb-hdrc musb-hdrc.1: MUSB HDRC host driver</div><div>[=C2=A0 =C2=
=A015.868016] musb-hdrc musb-hdrc.1: new USB bus registered, assigned bus n=
umber 1</div><div>[=C2=A0 =C2=A015.883041] hub 1-0:1.0: USB hub found</div>=
<div>[=C2=A0 =C2=A015.883105] hub 1-0:1.0: 1 port detected</div><div>[=C2=
=A0 =C2=A015.961998] remoteproc remoteproc2: 4a338000.pru is available</div=
><div>[=C2=A0 =C2=A015.967859] pru-rproc 4a338000.pru: PRU rproc node /ocp/=
pruss_soc_bus@4a326004/pruss@0/pru@38000 probed successfully</div><div>[=C2=
=A0 =C2=A016.320431] usb 1-1: new high-speed USB device number 2 using musb=
-hdrc</div><div>[=C2=A0 =C2=A053.040523] random: crng init done</div><div>[=
=C2=A0 =C2=A053.044007] random: 7 urandom warning(s) missed due to ratelimi=
ting</div></div><div><br></div><div>When I use &quot;lsusb&quot; I see this=
, and I&#39;m unable to use the modem:</div><div>Bus 001 Device 002: ID 05c=
6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL mode)<br></div><div><br></di=
v><div>LSMOD shows this:</div><div><div>root@target:~# lsmod</div><div>Modu=
le=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Size=C2=A0=
 Used by</div><div>pru_rproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 20480=C2=A0 0</div><div>musb_dsps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 20480=C2=A0 0</div><div>pruss_intc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A016384=C2=A0 1 pru_rproc</div><div>musb_hdrc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 98304=C2=A0 1 musb_dsps</div><div>ud=
c_core=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028672=C2=A0 1 =
musb_hdrc</div><div>pruss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 16384=C2=A0 1 pru_rproc</div><div>phy_am335x=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 2</div><div>usbcore=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0204800=C2=A0 1 musb_hdrc</div><di=
v>phy_generic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 phy_am=
335x</div><div>usb_common=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=
384=C2=A0 5 phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore</div><div>phy_a=
m335x_control=C2=A0 =C2=A0 =C2=A016384=C2=A0 1 phy_am335x</div><div>pm33xx=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 0=
</div><div>snd_soc_simple_card=C2=A0 =C2=A0 16384=C2=A0 0</div><div>snd_soc=
_simple_card_utils=C2=A0 =C2=A0 16384=C2=A0 1 snd_soc_simple_card</div><div=
>wkup_m3_rproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1</div><div>wk=
up_m3_ipc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 pm33xx</di=
v><div>remoteproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A040960=C2=
=A0 3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc</div><div>omap_aes_driver=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 24576=C2=A0 0</div><div>crypto_engine=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 16384=C2=A0 1 omap_aes_driver</div><div>omap_crypto=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 omap_aes_driver</div><div=
>omap_sham=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 28672=C2=A0 0</d=
iv><div>ti_emif_sram=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 1 =
pm33xx</div><div>pruss_soc_bus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=
=A0 0</div><div>rtc_omap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A020480=C2=A0 2</div><div>musb_am335x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 16384=C2=A0 0</div><div>omap_wdt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A016384=C2=A0 0</div><div>at24=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 0</div><div>sch_fq_co=
del=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020480=C2=A0 1</div></div><div><=
br></div><div>However, if I don&#39;t plug in the device until AFTER the sy=
stem boots and I login, then I see the cdc_wdm driver is gets registered an=
d the cdc-wdm0 device is created:</div><div><br></div><div><div>root@target=
:~# [=C2=A0 =C2=A060.630559] usb 1-1: new high-speed USB device number 2 us=
ing musb-hdrc</div><div>[=C2=A0 =C2=A060.993246] usbcore: registered new in=
terface driver cdc_wdm</div><div>[=C2=A0 =C2=A061.013436] qmi_wwan 1-1:1.2:=
 cdc-wdm0: USB WDM device</div><div>[=C2=A0 =C2=A061.038279] qmi_wwan 1-1:1=
.2 wwan0: register &#39;qmi_wwan&#39; at usb-musb-hdrc.1-1, WWAN/QMI device=
, be:ce:e7:34:15:d8</div><div>[=C2=A0 =C2=A061.059967] usbcore: registered =
new interface driver qmi_wwan</div></div><div><br></div><div>LSUSB shows me=
 this, and I&#39;m able to use the modem:</div><div><br></div><div><div>roo=
t@target:~# lsusb</div><div>Bus 001 Device 002: ID 1bc7:1040 Telit Wireless=
 Solutions</div></div><div><br></div><div>LSMOD shows this:</div><div><br><=
/div><div><div>root@target:~# lsmod</div><div>Module=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Size=C2=A0 Used by</div><div>qmi_=
wwan=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028672=C2=A0 0</d=
iv><div>cdc_wdm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2048=
0=C2=A0 1 qmi_wwan</div><div>usbnet=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A032768=C2=A0 1 qmi_wwan</div><div>pru_rproc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20480=C2=A0 0</div><div>pruss_int=
c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 1 pru_rproc</d=
iv><div>pruss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 16384=C2=A0 1 pru_rproc</div><div>musb_dsps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 20480=C2=A0 0</div><div>musb_hdrc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 98304=C2=A0 1 musb_dsps</div><div>udc_core=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028672=C2=A0 1 musb_hdrc</di=
v><div>usbcore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0204800=
=C2=A0 4 usbnet,qmi_wwan,cdc_wdm,musb_hdrc</div><div>phy_am335x=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01[=C2=A0 =C2=A078.790878] random: crn=
g init done</div><div>[=C2=A0 =C2=A078.799335] random: 7 urandom warning(s)=
 missed due to ratelimiting</div><div>6384=C2=A0 2</div><div>phy_generic=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 phy_am335x</div><div>u=
sb_common=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 5 phy_=
am335x,udc_core,musb_hdrc,musb_dsps,usbcore</div><div>phy_am335x_control=C2=
=A0 =C2=A0 =C2=A016384=C2=A0 1 phy_am335x</div><div>pm33xx=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 0</div><div>snd_so=
c_simple_card=C2=A0 =C2=A0 16384=C2=A0 0</div><div>snd_soc_simple_card_util=
s=C2=A0 =C2=A0 16384=C2=A0 1 snd_soc_simple_card</div><div>wkup_m3_ipc=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 pm33xx</div><div>wkup_=
m3_rproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1</div><div>remotepr=
oc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A040960=C2=A0 3 pru_rproc,w=
kup_m3_rproc,wkup_m3_ipc</div><div>omap_aes_driver=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 24576=C2=A0 0</div><div>crypto_engine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 16384=C2=A0 1 omap_aes_driver</div><div>omap_crypto=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 omap_aes_driver</div><div>omap_sham=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 28672=C2=A0 0</div><div>pruss=
_soc_bus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 0</div><div>ti_emif_=
sram=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 1 pm33xx</div><div=
>rtc_omap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020480=C2=A0=
 2</div><div>at24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A016384=C2=A0 0</div><div>omap_wdt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 0</div><div>musb_am335x=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 0</div><div>sch_fq_codel=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020480=C2=A0 1</div></div><div><br></div><div=
>And pointers on how I can get the drivers (cdc_wdm, qmi_wwan, etc) setup s=
o the USB modem is recognized at powerup instead of having to plug in the d=
evice after powerup would be greatly appreciated.</div><div><br></div><div>=
Thanks in advance!</div><div>-Leo</div></div></div></div></div></div></div>=
</div></div></div></div>

--0000000000007a08b50575c63a03--
