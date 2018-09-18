Return-Path: <leo.e.meza@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 873D5E0095C; Tue, 18 Sep 2018 09:52:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.43 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (leo.e.meza[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CCD5E0090A
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2018 09:52:25 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id y2-v6so3285248wma.1
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2018 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LFsAysfW2lyd+d8rseRmyS1DjM2tTrE+8VEBorpJGmQ=;
	b=gPR4h8D7+EqPAJzGzJPousA8PUJcTAwaM+dKXQl3oMRUqd0N/eo80k6O+lzcOv69Kk
	bNdLK53nHyig9mYcO7fY18p/BRXPuIHGdArC6VKqmyZiOLvKgf6JQXGiPb2EiJwL4luw
	8c8bGs9o9S2V6bSZKOF/fipC6rq+aJFOUQqS8qJ2iwAXIE0hN8gyB2y/D/0iixPPw9vO
	4SbB/ATLD4Q7jxrzVLZz2UnHOss3MR8VyNS5GPlvPvi1VCRY+P0OW9gA9HROBkxkpSdq
	q6dB1Dl/hGDqEz2nZcbin4qBIHXZtNDrMOYtEjq/v0qbgR7QbXrnJK68VC54usQc1rnC
	nx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LFsAysfW2lyd+d8rseRmyS1DjM2tTrE+8VEBorpJGmQ=;
	b=tWZddosuVa/w01IhLr7GRr7VkLKSKB+EV54MV7f/nm1Fnfjhf4ZhsQg7njszHzY8Ye
	a7I1WI/8fQfeoRxhauZws1X2J7ZhrXRVmO5T7752g1IO2gUIpMuEWqsubUbNIUhlUw2Q
	RYHgGll6nB4BWPDhrH0CGmuseAU2RDxXjfr3+owYRxklebudSXHA7/T+F4TyCasR+QHx
	d3QXAakFfkbB/EipLktWbIaOdcQF0owAwwocXOfejQjSgbyDM5OFKdywOhYoM8fO6ux7
	3ncJ84PwzGyYKW25BRuHxE9h0UAdDwBtIxQoLBLyNO4gGe4juZGdIb/+oGYtyOPtq6HE
	+seA==
X-Gm-Message-State: APzg51B6sWpC9Byd0mCndu7EYjIDxUfgTey17YizFv0jinpMdK1Enazm
	jtWK/1Cjppck3NzHwIPyq2SgI8EtB3jAEB7ezRflDg==
X-Google-Smtp-Source: ANB0VdbMsdu9zzEwmZzdDnZXZzwj45rdNUfN+tinRjKECzTWgEd4z4wOt0vLM4zPe6m8/9bva+hgxMBQ6Lgtw56r7qE=
X-Received: by 2002:a1c:7c18:: with SMTP id
	x24-v6mr14116944wmc.33.1537289544523; 
	Tue, 18 Sep 2018 09:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <CADrbpyy84sPcVX2ZdpNrkdyakucozgn-5VSXsvCFH9GHM4B+Nw@mail.gmail.com>
	<20180914011625.GR12296@beryl>
	<CADrbpyzuitZXpYNawv8FPYuP6jvCh5i2EsJa=f1huRFGKTyMPA@mail.gmail.com>
In-Reply-To: <CADrbpyzuitZXpYNawv8FPYuP6jvCh5i2EsJa=f1huRFGKTyMPA@mail.gmail.com>
From: Leo Meza <leo.e.meza@gmail.com>
Date: Tue, 18 Sep 2018 09:52:13 -0700
Message-ID: <CADrbpyyr3kz9OCMYEenm-h-ox6PNf-59it-GJCcFs5jyWhn-CA@mail.gmail.com>
To: denys@ti.com
Cc: meta-ti@yoctoproject.org
Subject: Re: musb_hdrc driver and "Qualcomm, Inc. Gobi Wireless Modem"
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
X-List-Received-Date: Tue, 18 Sep 2018 16:52:27 -0000
Content-Type: multipart/alternative; boundary="0000000000003801d60576281df6"

--0000000000003801d60576281df6
Content-Type: text/plain; charset="UTF-8"

Denys (or anyone),

Can you recommend a Distory (Poky?) and target (core-image-sato?) that I
can use to make this a more reproducible issue? I suppose that might be
more desirable than using my custom distro. I'm not sure witch Poky
distro/target would be best suitable for getting my USB modem to work.

Thanks again,
Leo

On Fri, Sep 14, 2018 at 10:34 AM Leo Meza <leo.e.meza@gmail.com> wrote:

> SystemD
>
> mydistro.conf
> ----------------------------
> DISTRO = "mydistro"
> DISTRO_NAME = "My Distro (Linux Distro for me)"
> DISTRO_VERSION = "0.0.1"
> DISTRO_CODENAME = "plzwork"
>
> MAINTAINER = "me <me@aol.com>"
>
> DISTRO_FEATURES = " \
>     ext2 \
>     largefile \
>     systemd \
>     ${DISTRO_FEATURES_LIBC} \
> "
> VIRTUAL-RUNTIME_dev_manager = "udev"
> VIRTUAL-RUNTIME_init_manager = "systemd"
> VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
>
> mylayer.conf (almost identical to am335x-evm.conf)
> ----------------------------
> require conf/machine/include/ti33x.inc
> ...
> MACHINE_FEATURES_remove += " alsa vfat"
> ...
> MACHINE_EXTRA_RDEPENDS = "kernel-modules"
>
>
> Again, when I power up this is what prints to the terminal:
>
> -------------------------------------------------------------------------------
> U-Boot SPL 2018.01-......
> ...
> Starting kernel...
> <lots of messages>
> ...
> My Distro (Linux Distro for me) 0.0.1 target ttyS0
>
> target login: [   11.597569] usbcore: registered new interface driver usbfs
> [   11.597619] usbcore: registered new interface driver hub
> [   11.625583] usbcore: registered new device driver usb
> [   11.761603] am335x-phy-driver 47401b00.usb-phy: 47401b00.usb-phy supply
> vcc not found, using dummy regulator
> [   11.813980] pruss 4a300000.pruss: creating PRU cores and other child
> platform devices
> [   11.868211] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
> [   11.916108] musb-hdrc musb-hdrc.1: new USB bus registered, assigned bus
> number 1
> [   11.973481] hub 1-0:1.0: USB hub found
> [   11.989178] remoteproc remoteproc1: 4a334000.pru is available
> [   12.005276] hub 1-0:1.0: 1 port detected
> [   12.040483] pru-rproc 4a334000.pru: PRU rproc node
> /ocp/pruss_soc_bus@4a326004/pruss@0/pru@34000 probed successfully
> [   12.071947] remoteproc remoteproc2: 4a338000.pru is available
> [   12.077818] pru-rproc 4a338000.pru: PRU rproc node
> /ocp/pruss_soc_bus@4a326004/pruss@0/pru@38000 probed successfully
> [   12.440276] usb 1-1: new high-speed USB device number 2 using musb-hdrc
>
> It hangs right here until I press enter. Seems like this is where the
> usbcore should be registering the cdc_wdm and qmi_wwan drivers.
>
> Thanks again,
> Leo
>
>
> On Thu, Sep 13, 2018 at 6:17 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
>> On Thu, Sep 13, 2018 at 01:05:17PM -0700, Leo Meza wrote:
>> > I'm trying to get my target to recognize a USB-connected 4G LTE modem on
>> > powerup....
>> >
>> > My target is a beaglebone black (AM335x) using meta-ti "rocko" branch
>> and
>>
>> What's your distro and specifically, what init system and device
>> management?
>> I.e. SysVinit, udev, systemd, etc.
>>
>> --
>> Denys
>>
>>
>> > I've added a kernel config fragment with the following:
>> > CONFIG_USB_NET_QMI_WWAN=m
>> >
>> > My distro.conf file removes the usbgadget and usbhost features:
>> > MACHINE_FEATURES_remove += " alsa usbgadget usbhost vfat"
>> >
>> > So far, when I power up the target, it looks as though the musb-hdrc
>> driver
>> > is attaching to the USB Modem:
>> > [   15.467735] usbcore: registered new interface driver usbfs
>> > [   15.475891] am335x-phy-driver 47401300.usb-phy: 47401300.usb-phy
>> supply
>> > vcc not found, using dummy regulator
>> > [   15.483431] am335x-phy-driver 47401b00.usb-phy: 47401b00.usb-phy
>> supply
>> > vcc not found, using dummy regulator
>> > [   15.625497] pruss 4a300000.pruss: creating PRU cores and other child
>> > platform devices
>> > [   15.639846] usbcore: registered new interface driver hub
>> > [   15.718440] usbcore: registered new device driver usb
>> > [   15.831900] remoteproc remoteproc1: 4a334000.pru is available
>> > [   15.837767] pru-rproc 4a334000.pru: PRU rproc node
>> > /ocp/pruss_soc_bus@4a326004/pruss@0/pru@34000 probed successfully
>> > [   15.867980] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
>> > [   15.868016] musb-hdrc musb-hdrc.1: new USB bus registered, assigned
>> bus
>> > number 1
>> > [   15.883041] hub 1-0:1.0: USB hub found
>> > [   15.883105] hub 1-0:1.0: 1 port detected
>> > [   15.961998] remoteproc remoteproc2: 4a338000.pru is available
>> > [   15.967859] pru-rproc 4a338000.pru: PRU rproc node
>> > /ocp/pruss_soc_bus@4a326004/pruss@0/pru@38000 probed successfully
>> > [   16.320431] usb 1-1: new high-speed USB device number 2 using
>> musb-hdrc
>> > [   53.040523] random: crng init done
>> > [   53.044007] random: 7 urandom warning(s) missed due to ratelimiting
>> >
>> > When I use "lsusb" I see this, and I'm unable to use the modem:
>> > Bus 001 Device 002: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL
>> > mode)
>> >
>> > LSMOD shows this:
>> > root@target:~# lsmod
>> > Module                  Size  Used by
>> > pru_rproc              20480  0
>> > musb_dsps              20480  0
>> > pruss_intc             16384  1 pru_rproc
>> > musb_hdrc              98304  1 musb_dsps
>> > udc_core               28672  1 musb_hdrc
>> > pruss                  16384  1 pru_rproc
>> > phy_am335x             16384  2
>> > usbcore               204800  1 musb_hdrc
>> > phy_generic            16384  1 phy_am335x
>> > usb_common             16384  5
>> > phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore
>> > phy_am335x_control     16384  1 phy_am335x
>> > pm33xx                 16384  0
>> > snd_soc_simple_card    16384  0
>> > snd_soc_simple_card_utils    16384  1 snd_soc_simple_card
>> > wkup_m3_rproc          16384  1
>> > wkup_m3_ipc            16384  1 pm33xx
>> > remoteproc             40960  3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc
>> > omap_aes_driver        24576  0
>> > crypto_engine          16384  1 omap_aes_driver
>> > omap_crypto            16384  1 omap_aes_driver
>> > omap_sham              28672  0
>> > ti_emif_sram           16384  1 pm33xx
>> > pruss_soc_bus          16384  0
>> > rtc_omap               20480  2
>> > musb_am335x            16384  0
>> > omap_wdt               16384  0
>> > at24                   16384  0
>> > sch_fq_codel           20480  1
>> >
>> > However, if I don't plug in the device until AFTER the system boots and
>> I
>> > login, then I see the cdc_wdm driver is gets registered and the cdc-wdm0
>> > device is created:
>> >
>> > root@target:~# [   60.630559] usb 1-1: new high-speed USB device
>> number 2
>> > using musb-hdrc
>> > [   60.993246] usbcore: registered new interface driver cdc_wdm
>> > [   61.013436] qmi_wwan 1-1:1.2: cdc-wdm0: USB WDM device
>> > [   61.038279] qmi_wwan 1-1:1.2 wwan0: register 'qmi_wwan' at
>> > usb-musb-hdrc.1-1, WWAN/QMI device, be:ce:e7:34:15:d8
>> > [   61.059967] usbcore: registered new interface driver qmi_wwan
>> >
>> > LSUSB shows me this, and I'm able to use the modem:
>> >
>> > root@target:~# lsusb
>> > Bus 001 Device 002: ID 1bc7:1040 Telit Wireless Solutions
>> >
>> > LSMOD shows this:
>> >
>> > root@target:~# lsmod
>> > Module                  Size  Used by
>> > qmi_wwan               28672  0
>> > cdc_wdm                20480  1 qmi_wwan
>> > usbnet                 32768  1 qmi_wwan
>> > pru_rproc              20480  0
>> > pruss_intc             16384  1 pru_rproc
>> > pruss                  16384  1 pru_rproc
>> > musb_dsps              20480  0
>> > musb_hdrc              98304  1 musb_dsps
>> > udc_core               28672  1 musb_hdrc
>> > usbcore               204800  4 usbnet,qmi_wwan,cdc_wdm,musb_hdrc
>> > phy_am335x             1[   78.790878] random: crng init done
>> > [   78.799335] random: 7 urandom warning(s) missed due to ratelimiting
>> > 6384  2
>> > phy_generic            16384  1 phy_am335x
>> > usb_common             16384  5
>> > phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore
>> > phy_am335x_control     16384  1 phy_am335x
>> > pm33xx                 16384  0
>> > snd_soc_simple_card    16384  0
>> > snd_soc_simple_card_utils    16384  1 snd_soc_simple_card
>> > wkup_m3_ipc            16384  1 pm33xx
>> > wkup_m3_rproc          16384  1
>> > remoteproc             40960  3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc
>> > omap_aes_driver        24576  0
>> > crypto_engine          16384  1 omap_aes_driver
>> > omap_crypto            16384  1 omap_aes_driver
>> > omap_sham              28672  0
>> > pruss_soc_bus          16384  0
>> > ti_emif_sram           16384  1 pm33xx
>> > rtc_omap               20480  2
>> > at24                   16384  0
>> > omap_wdt               16384  0
>> > musb_am335x            16384  0
>> > sch_fq_codel           20480  1
>> >
>> > And pointers on how I can get the drivers (cdc_wdm, qmi_wwan, etc)
>> setup so
>> > the USB modem is recognized at powerup instead of having to plug in the
>> > device after powerup would be greatly appreciated.
>> >
>> > Thanks in advance!
>> > -Leo
>>
>> > --
>> > _______________________________________________
>> > meta-ti mailing list
>> > meta-ti@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-ti
>>
>>

--0000000000003801d60576281df6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Denys (or anyone),<div><br></div><div>Can you recommend a =
Distory (Poky?) and target (core-image-sato?) that I can use to make this a=
 more reproducible issue? I suppose that might be more desirable than using=
 my custom distro. I&#39;m not sure witch Poky distro/target would be best =
suitable for getting my USB modem to work.</div><div><br></div><div>Thanks =
again,</div><div>Leo</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Fri, Sep 14, 2018 at 10:34 AM Leo Meza &lt;<a href=3D"mailto:leo.e.=
meza@gmail.com">leo.e.meza@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div>SystemD</div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">mydistro.conf<div>----------------------------</div><div><div>DIST=
RO =3D &quot;mydistro&quot;</div><div>DISTRO_NAME =3D &quot;My Distro (Linu=
x Distro for me)&quot;</div><div>DISTRO_VERSION =3D &quot;0.0.1&quot;</div>=
<div>DISTRO_CODENAME =3D &quot;plzwork&quot;</div><div><br></div><div>MAINT=
AINER =3D &quot;me &lt;<a href=3D"mailto:me@aol.com" target=3D"_blank">me@a=
ol.com</a>&gt;&quot;</div><div><br></div><div>DISTRO_FEATURES =3D &quot; \<=
/div><div>=C2=A0 =C2=A0 ext2 \</div><div>=C2=A0 =C2=A0 largefile \</div><di=
v>=C2=A0 =C2=A0 systemd \</div><div>=C2=A0 =C2=A0 ${DISTRO_FEATURES_LIBC} \=
</div><div>&quot;</div><div>VIRTUAL-RUNTIME_dev_manager =3D &quot;udev&quot=
;<br></div><div>VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;<br></d=
iv><div>VIRTUAL-RUNTIME_initscripts =3D &quot;systemd-compat-units&quot;</d=
iv><div>DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;sysvinit&quot;</div>=
</div><div><br></div><div>mylayer.conf (almost identical to am335x-evm.conf=
)</div>----------------------------<div>require conf/machine/include/ti33x.=
inc<br></div><div>...</div><div>MACHINE_FEATURES_remove +=3D &quot; alsa vf=
at&quot;<br></div><div>...</div><div><div>MACHINE_EXTRA_RDEPENDS =3D &quot;=
kernel-modules&quot;</div></div><div><br></div><div><br></div><div>Again, w=
hen I power up this is what prints to the terminal:</div><div>-------------=
------------------------------------------------------------------</div><di=
v>U-Boot SPL 2018.01-......</div><div>...</div><div>Starting kernel...</div=
><div>&lt;lots of messages&gt;</div><div>...</div><div>My Distro (Linux Dis=
tro for me) 0.0.1 target ttyS0<br></div><div><div><br></div><div>target log=
in: [=C2=A0 =C2=A011.597569] usbcore: registered new interface driver usbfs=
</div><div>[=C2=A0 =C2=A011.597619] usbcore: registered new interface drive=
r hub</div><div>[=C2=A0 =C2=A011.625583] usbcore: registered new device dri=
ver usb</div><div>[=C2=A0 =C2=A011.761603] am335x-phy-driver 47401b00.usb-p=
hy: 47401b00.usb-phy supply vcc not found, using dummy regulator</div><div>=
[=C2=A0 =C2=A011.813980] pruss 4a300000.pruss: creating PRU cores and other=
 child platform devices</div><div>[=C2=A0 =C2=A011.868211] musb-hdrc musb-h=
drc.1: MUSB HDRC host driver</div><div>[=C2=A0 =C2=A011.916108] musb-hdrc m=
usb-hdrc.1: new USB bus registered, assigned bus number 1</div><div>[=C2=A0=
 =C2=A011.973481] hub 1-0:1.0: USB hub found</div><div>[=C2=A0 =C2=A011.989=
178] remoteproc remoteproc1: 4a334000.pru is available</div><div>[=C2=A0 =
=C2=A012.005276] hub 1-0:1.0: 1 port detected</div><div>[=C2=A0 =C2=A012.04=
0483] pru-rproc 4a334000.pru: PRU rproc node /ocp/pruss_soc_bus@4a326004/pr=
uss@0/pru@34000 probed successfully</div><div>[=C2=A0 =C2=A012.071947] remo=
teproc remoteproc2: 4a338000.pru is available</div><div>[=C2=A0 =C2=A012.07=
7818] pru-rproc 4a338000.pru: PRU rproc node /ocp/pruss_soc_bus@4a326004/pr=
uss@0/pru@38000 probed successfully</div><div>[=C2=A0 =C2=A012.440276] usb =
1-1: new high-speed USB device number 2 using musb-hdrc</div></div><div><br=
></div><div>It hangs right here until I press enter. Seems like this is whe=
re the usbcore should be registering the cdc_wdm and qmi_wwan drivers.</div=
><div><br></div><div>Thanks again,</div><div>Leo</div><div><br></div></div>=
</div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Thu, Sep 13, 2018 at 6:17 PM Denys Dmytriyenko &lt;<a href=3D"mailto:=
denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Thu, Sep 13, 2018 at 01:05:1=
7PM -0700, Leo Meza wrote:<br>
&gt; I&#39;m trying to get my target to recognize a USB-connected 4G LTE mo=
dem on<br>
&gt; powerup....<br>
&gt; <br>
&gt; My target is a beaglebone black (AM335x) using meta-ti &quot;rocko&quo=
t; branch and<br>
<br>
What&#39;s your distro and specifically, what init system and device manage=
ment? <br>
I.e. SysVinit, udev, systemd, etc.<br>
<br>
-- <br>
Denys<br>
<br>
<br>
&gt; I&#39;ve added a kernel config fragment with the following:<br>
&gt; CONFIG_USB_NET_QMI_WWAN=3Dm<br>
&gt; <br>
&gt; My distro.conf file removes the usbgadget and usbhost features:<br>
&gt; MACHINE_FEATURES_remove +=3D &quot; alsa usbgadget usbhost vfat&quot;<=
br>
&gt; <br>
&gt; So far, when I power up the target, it looks as though the musb-hdrc d=
river<br>
&gt; is attaching to the USB Modem:<br>
&gt; [=C2=A0 =C2=A015.467735] usbcore: registered new interface driver usbf=
s<br>
&gt; [=C2=A0 =C2=A015.475891] am335x-phy-driver 47401300.usb-phy: 47401300.=
usb-phy supply<br>
&gt; vcc not found, using dummy regulator<br>
&gt; [=C2=A0 =C2=A015.483431] am335x-phy-driver 47401b00.usb-phy: 47401b00.=
usb-phy supply<br>
&gt; vcc not found, using dummy regulator<br>
&gt; [=C2=A0 =C2=A015.625497] pruss 4a300000.pruss: creating PRU cores and =
other child<br>
&gt; platform devices<br>
&gt; [=C2=A0 =C2=A015.639846] usbcore: registered new interface driver hub<=
br>
&gt; [=C2=A0 =C2=A015.718440] usbcore: registered new device driver usb<br>
&gt; [=C2=A0 =C2=A015.831900] remoteproc remoteproc1: 4a334000.pru is avail=
able<br>
&gt; [=C2=A0 =C2=A015.837767] pru-rproc 4a334000.pru: PRU rproc node<br>
&gt; /ocp/pruss_soc_bus@4a326004/pruss@0/pru@34000 probed successfully<br>
&gt; [=C2=A0 =C2=A015.867980] musb-hdrc musb-hdrc.1: MUSB HDRC host driver<=
br>
&gt; [=C2=A0 =C2=A015.868016] musb-hdrc musb-hdrc.1: new USB bus registered=
, assigned bus<br>
&gt; number 1<br>
&gt; [=C2=A0 =C2=A015.883041] hub 1-0:1.0: USB hub found<br>
&gt; [=C2=A0 =C2=A015.883105] hub 1-0:1.0: 1 port detected<br>
&gt; [=C2=A0 =C2=A015.961998] remoteproc remoteproc2: 4a338000.pru is avail=
able<br>
&gt; [=C2=A0 =C2=A015.967859] pru-rproc 4a338000.pru: PRU rproc node<br>
&gt; /ocp/pruss_soc_bus@4a326004/pruss@0/pru@38000 probed successfully<br>
&gt; [=C2=A0 =C2=A016.320431] usb 1-1: new high-speed USB device number 2 u=
sing musb-hdrc<br>
&gt; [=C2=A0 =C2=A053.040523] random: crng init done<br>
&gt; [=C2=A0 =C2=A053.044007] random: 7 urandom warning(s) missed due to ra=
telimiting<br>
&gt; <br>
&gt; When I use &quot;lsusb&quot; I see this, and I&#39;m unable to use the=
 modem:<br>
&gt; Bus 001 Device 002: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (Q=
DL<br>
&gt; mode)<br>
&gt; <br>
&gt; LSMOD shows this:<br>
&gt; root@target:~# lsmod<br>
&gt; Module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
ize=C2=A0 Used by<br>
&gt; pru_rproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20480=C2=A0 =
0<br>
&gt; musb_dsps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20480=C2=A0 =
0<br>
&gt; pruss_intc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 =
1 pru_rproc<br>
&gt; musb_hdrc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 98304=C2=A0 =
1 musb_dsps<br>
&gt; udc_core=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028672=
=C2=A0 1 musb_hdrc<br>
&gt; pruss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16=
384=C2=A0 1 pru_rproc<br>
&gt; phy_am335x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 =
2<br>
&gt; usbcore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0204800=
=C2=A0 1 musb_hdrc<br>
&gt; phy_generic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 phy=
_am335x<br>
&gt; usb_common=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 =
5<br>
&gt; phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore<br>
&gt; phy_am335x_control=C2=A0 =C2=A0 =C2=A016384=C2=A0 1 phy_am335x<br>
&gt; pm33xx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=
384=C2=A0 0<br>
&gt; snd_soc_simple_card=C2=A0 =C2=A0 16384=C2=A0 0<br>
&gt; snd_soc_simple_card_utils=C2=A0 =C2=A0 16384=C2=A0 1 snd_soc_simple_ca=
rd<br>
&gt; wkup_m3_rproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1<br>
&gt; wkup_m3_ipc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 pm3=
3xx<br>
&gt; remoteproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A040960=C2=A0 =
3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc<br>
&gt; omap_aes_driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 24576=C2=A0 0<br>
&gt; crypto_engine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 omap_aes=
_driver<br>
&gt; omap_crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 oma=
p_aes_driver<br>
&gt; omap_sham=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 28672=C2=A0 =
0<br>
&gt; ti_emif_sram=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 1 pm3=
3xx<br>
&gt; pruss_soc_bus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 0<br>
&gt; rtc_omap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020480=
=C2=A0 2<br>
&gt; musb_am335x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 0<br>
&gt; omap_wdt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=
=C2=A0 0<br>
&gt; at24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A016384=C2=A0 0<br>
&gt; sch_fq_codel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020480=C2=A0 1<br>
&gt; <br>
&gt; However, if I don&#39;t plug in the device until AFTER the system boot=
s and I<br>
&gt; login, then I see the cdc_wdm driver is gets registered and the cdc-wd=
m0<br>
&gt; device is created:<br>
&gt; <br>
&gt; root@target:~# [=C2=A0 =C2=A060.630559] usb 1-1: new high-speed USB de=
vice number 2<br>
&gt; using musb-hdrc<br>
&gt; [=C2=A0 =C2=A060.993246] usbcore: registered new interface driver cdc_=
wdm<br>
&gt; [=C2=A0 =C2=A061.013436] qmi_wwan 1-1:1.2: cdc-wdm0: USB WDM device<br=
>
&gt; [=C2=A0 =C2=A061.038279] qmi_wwan 1-1:1.2 wwan0: register &#39;qmi_wwa=
n&#39; at<br>
&gt; usb-musb-hdrc.1-1, WWAN/QMI device, be:ce:e7:34:15:d8<br>
&gt; [=C2=A0 =C2=A061.059967] usbcore: registered new interface driver qmi_=
wwan<br>
&gt; <br>
&gt; LSUSB shows me this, and I&#39;m able to use the modem:<br>
&gt; <br>
&gt; root@target:~# lsusb<br>
&gt; Bus 001 Device 002: ID 1bc7:1040 Telit Wireless Solutions<br>
&gt; <br>
&gt; LSMOD shows this:<br>
&gt; <br>
&gt; root@target:~# lsmod<br>
&gt; Module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
ize=C2=A0 Used by<br>
&gt; qmi_wwan=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028672=
=C2=A0 0<br>
&gt; cdc_wdm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20480=
=C2=A0 1 qmi_wwan<br>
&gt; usbnet=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032=
768=C2=A0 1 qmi_wwan<br>
&gt; pru_rproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20480=C2=A0 =
0<br>
&gt; pruss_intc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 =
1 pru_rproc<br>
&gt; pruss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16=
384=C2=A0 1 pru_rproc<br>
&gt; musb_dsps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20480=C2=A0 =
0<br>
&gt; musb_hdrc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 98304=C2=A0 =
1 musb_dsps<br>
&gt; udc_core=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028672=
=C2=A0 1 musb_hdrc<br>
&gt; usbcore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0204800=
=C2=A0 4 usbnet,qmi_wwan,cdc_wdm,musb_hdrc<br>
&gt; phy_am335x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01[=C2=A0 =C2=
=A078.790878] random: crng init done<br>
&gt; [=C2=A0 =C2=A078.799335] random: 7 urandom warning(s) missed due to ra=
telimiting<br>
&gt; 6384=C2=A0 2<br>
&gt; phy_generic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 phy=
_am335x<br>
&gt; usb_common=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 =
5<br>
&gt; phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore<br>
&gt; phy_am335x_control=C2=A0 =C2=A0 =C2=A016384=C2=A0 1 phy_am335x<br>
&gt; pm33xx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=
384=C2=A0 0<br>
&gt; snd_soc_simple_card=C2=A0 =C2=A0 16384=C2=A0 0<br>
&gt; snd_soc_simple_card_utils=C2=A0 =C2=A0 16384=C2=A0 1 snd_soc_simple_ca=
rd<br>
&gt; wkup_m3_ipc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 pm3=
3xx<br>
&gt; wkup_m3_rproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1<br>
&gt; remoteproc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A040960=C2=A0 =
3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc<br>
&gt; omap_aes_driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 24576=C2=A0 0<br>
&gt; crypto_engine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 omap_aes=
_driver<br>
&gt; omap_crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 1 oma=
p_aes_driver<br>
&gt; omap_sham=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 28672=C2=A0 =
0<br>
&gt; pruss_soc_bus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 0<br>
&gt; ti_emif_sram=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 1 pm3=
3xx<br>
&gt; rtc_omap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020480=
=C2=A0 2<br>
&gt; at24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A016384=C2=A0 0<br>
&gt; omap_wdt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=
=C2=A0 0<br>
&gt; musb_am335x=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384=C2=A0 0<br>
&gt; sch_fq_codel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020480=C2=A0 1<br>
&gt; <br>
&gt; And pointers on how I can get the drivers (cdc_wdm, qmi_wwan, etc) set=
up so<br>
&gt; the USB modem is recognized at powerup instead of having to plug in th=
e<br>
&gt; device after powerup would be greatly appreciated.<br>
&gt; <br>
&gt; Thanks in advance!<br>
&gt; -Leo<br>
<br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
<br>
</blockquote></div></div></div></div></div>
</blockquote></div>

--0000000000003801d60576281df6--
