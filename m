Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0617E0097C; Thu, 13 Sep 2018 18:17:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 695C7E006AF
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 18:17:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8E1Hodv063633;
	Thu, 13 Sep 2018 20:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536887870;
	bh=4Gtgoagv4Q9rz0/XdgnQIxV2LqI/IVTQrDi4OqdR9Ms=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yfRTsFPLc3iUD5DRsH28IUXViEQAJRVWI84fkcYL9FqQFs92zSkB4IGpRbM/hi09e
	r0uzFGjzGb+TVv2uFnsRK5gqgIdNFTlSUB+Sh84M1wXbeZ6w03NWqEvqQGKGnXxYC4
	lDyiqA35GGXcN/1fCUU7r4zd0msqzam9bi7sRiVU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8E1HoPX017464;
	Thu, 13 Sep 2018 20:17:50 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 20:17:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 20:17:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8E1Hoxt027490;
	Thu, 13 Sep 2018 20:17:50 -0500
Date: Thu, 13 Sep 2018 21:16:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Leo Meza <leo.e.meza@gmail.com>
Message-ID: <20180914011625.GR12296@beryl>
References: <CADrbpyy84sPcVX2ZdpNrkdyakucozgn-5VSXsvCFH9GHM4B+Nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrbpyy84sPcVX2ZdpNrkdyakucozgn-5VSXsvCFH9GHM4B+Nw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Fri, 14 Sep 2018 01:17:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 13, 2018 at 01:05:17PM -0700, Leo Meza wrote:
> I'm trying to get my target to recognize a USB-connected 4G LTE modem on
> powerup....
> 
> My target is a beaglebone black (AM335x) using meta-ti "rocko" branch and

What's your distro and specifically, what init system and device management? 
I.e. SysVinit, udev, systemd, etc.

-- 
Denys


> I've added a kernel config fragment with the following:
> CONFIG_USB_NET_QMI_WWAN=m
> 
> My distro.conf file removes the usbgadget and usbhost features:
> MACHINE_FEATURES_remove += " alsa usbgadget usbhost vfat"
> 
> So far, when I power up the target, it looks as though the musb-hdrc driver
> is attaching to the USB Modem:
> [   15.467735] usbcore: registered new interface driver usbfs
> [   15.475891] am335x-phy-driver 47401300.usb-phy: 47401300.usb-phy supply
> vcc not found, using dummy regulator
> [   15.483431] am335x-phy-driver 47401b00.usb-phy: 47401b00.usb-phy supply
> vcc not found, using dummy regulator
> [   15.625497] pruss 4a300000.pruss: creating PRU cores and other child
> platform devices
> [   15.639846] usbcore: registered new interface driver hub
> [   15.718440] usbcore: registered new device driver usb
> [   15.831900] remoteproc remoteproc1: 4a334000.pru is available
> [   15.837767] pru-rproc 4a334000.pru: PRU rproc node
> /ocp/pruss_soc_bus@4a326004/pruss@0/pru@34000 probed successfully
> [   15.867980] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
> [   15.868016] musb-hdrc musb-hdrc.1: new USB bus registered, assigned bus
> number 1
> [   15.883041] hub 1-0:1.0: USB hub found
> [   15.883105] hub 1-0:1.0: 1 port detected
> [   15.961998] remoteproc remoteproc2: 4a338000.pru is available
> [   15.967859] pru-rproc 4a338000.pru: PRU rproc node
> /ocp/pruss_soc_bus@4a326004/pruss@0/pru@38000 probed successfully
> [   16.320431] usb 1-1: new high-speed USB device number 2 using musb-hdrc
> [   53.040523] random: crng init done
> [   53.044007] random: 7 urandom warning(s) missed due to ratelimiting
> 
> When I use "lsusb" I see this, and I'm unable to use the modem:
> Bus 001 Device 002: ID 05c6:9008 Qualcomm, Inc. Gobi Wireless Modem (QDL
> mode)
> 
> LSMOD shows this:
> root@target:~# lsmod
> Module                  Size  Used by
> pru_rproc              20480  0
> musb_dsps              20480  0
> pruss_intc             16384  1 pru_rproc
> musb_hdrc              98304  1 musb_dsps
> udc_core               28672  1 musb_hdrc
> pruss                  16384  1 pru_rproc
> phy_am335x             16384  2
> usbcore               204800  1 musb_hdrc
> phy_generic            16384  1 phy_am335x
> usb_common             16384  5
> phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore
> phy_am335x_control     16384  1 phy_am335x
> pm33xx                 16384  0
> snd_soc_simple_card    16384  0
> snd_soc_simple_card_utils    16384  1 snd_soc_simple_card
> wkup_m3_rproc          16384  1
> wkup_m3_ipc            16384  1 pm33xx
> remoteproc             40960  3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc
> omap_aes_driver        24576  0
> crypto_engine          16384  1 omap_aes_driver
> omap_crypto            16384  1 omap_aes_driver
> omap_sham              28672  0
> ti_emif_sram           16384  1 pm33xx
> pruss_soc_bus          16384  0
> rtc_omap               20480  2
> musb_am335x            16384  0
> omap_wdt               16384  0
> at24                   16384  0
> sch_fq_codel           20480  1
> 
> However, if I don't plug in the device until AFTER the system boots and I
> login, then I see the cdc_wdm driver is gets registered and the cdc-wdm0
> device is created:
> 
> root@target:~# [   60.630559] usb 1-1: new high-speed USB device number 2
> using musb-hdrc
> [   60.993246] usbcore: registered new interface driver cdc_wdm
> [   61.013436] qmi_wwan 1-1:1.2: cdc-wdm0: USB WDM device
> [   61.038279] qmi_wwan 1-1:1.2 wwan0: register 'qmi_wwan' at
> usb-musb-hdrc.1-1, WWAN/QMI device, be:ce:e7:34:15:d8
> [   61.059967] usbcore: registered new interface driver qmi_wwan
> 
> LSUSB shows me this, and I'm able to use the modem:
> 
> root@target:~# lsusb
> Bus 001 Device 002: ID 1bc7:1040 Telit Wireless Solutions
> 
> LSMOD shows this:
> 
> root@target:~# lsmod
> Module                  Size  Used by
> qmi_wwan               28672  0
> cdc_wdm                20480  1 qmi_wwan
> usbnet                 32768  1 qmi_wwan
> pru_rproc              20480  0
> pruss_intc             16384  1 pru_rproc
> pruss                  16384  1 pru_rproc
> musb_dsps              20480  0
> musb_hdrc              98304  1 musb_dsps
> udc_core               28672  1 musb_hdrc
> usbcore               204800  4 usbnet,qmi_wwan,cdc_wdm,musb_hdrc
> phy_am335x             1[   78.790878] random: crng init done
> [   78.799335] random: 7 urandom warning(s) missed due to ratelimiting
> 6384  2
> phy_generic            16384  1 phy_am335x
> usb_common             16384  5
> phy_am335x,udc_core,musb_hdrc,musb_dsps,usbcore
> phy_am335x_control     16384  1 phy_am335x
> pm33xx                 16384  0
> snd_soc_simple_card    16384  0
> snd_soc_simple_card_utils    16384  1 snd_soc_simple_card
> wkup_m3_ipc            16384  1 pm33xx
> wkup_m3_rproc          16384  1
> remoteproc             40960  3 pru_rproc,wkup_m3_rproc,wkup_m3_ipc
> omap_aes_driver        24576  0
> crypto_engine          16384  1 omap_aes_driver
> omap_crypto            16384  1 omap_aes_driver
> omap_sham              28672  0
> pruss_soc_bus          16384  0
> ti_emif_sram           16384  1 pm33xx
> rtc_omap               20480  2
> at24                   16384  0
> omap_wdt               16384  0
> musb_am335x            16384  0
> sch_fq_codel           20480  1
> 
> And pointers on how I can get the drivers (cdc_wdm, qmi_wwan, etc) setup so
> the USB modem is recognized at powerup instead of having to plug in the
> device after powerup would be greatly appreciated.
> 
> Thanks in advance!
> -Leo

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


