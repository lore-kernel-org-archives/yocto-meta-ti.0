Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.11358.1578428954635357014
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jan 2020 12:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KEezfE/m;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007KTDKn014060;
	Tue, 7 Jan 2020 14:29:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578428953;
	bh=wL/Mocy+2guTDxs9toG8yEEr4WZJ0hs4QE0T8j3qaqM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KEezfE/mpps9yUuPpR+5HZeLaYmcpGMfm2nAY0CYB8ur1zEiyEhg5y5ho8K+1n7aA
	 0vw4DY9mgCj9MTWocTtC5zkGov6YJHGp0YUP5yRfmwkEIodPD82OGFyAFbLlRyl16q
	 HKNJF2wZX4BBvvuRbiiHpSUOBWlem6SyEDQpkDIw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007KTD03122308;
	Tue, 7 Jan 2020 14:29:13 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 14:29:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 14:29:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007KTDsd029271;
	Tue, 7 Jan 2020 14:29:13 -0600
Date: Tue, 7 Jan 2020 15:29:13 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Theodore A. Roth" <troth@openavr.org>
CC: "Andrew F. Davis" <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] beagle-x15: add am5729-beagleboneai.dtb
Message-ID: <20200107202913.GC2305@beryl>
References: <20200102194059.GA13220@beast>
 <d626ca1c-6e7f-0412-5a6c-8021a9eb8237@ti.com>
 <CAFMvBt2hut8kkGo4O3NAecQ5Vs=hSLQ5GRJDTk144OnsL-uxLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFMvBt2hut8kkGo4O3NAecQ5Vs=hSLQ5GRJDTk144OnsL-uxLw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 03, 2020 at 04:35:45PM -0700, Theodore A. Roth wrote:
> On Fri, Jan 3, 2020 at 2:30 PM Andrew F. Davis <afd@ti.com> wrote:
> >
> > On 1/2/20 2:40 PM, Theodore A. Roth wrote:
> > > Signed-off-by: Theodore A. Roth <troth@openavr.org>
> > > ---
> > >  conf/machine/beagle-x15.conf | 5 ++++-
> >
> >
> > Why add this to the X15 machine? The Beagebone AI is not an X15, the
> > catch all for AM57xx machines seems to be am57xx-evm.conf, which already
> > has the am5729-beagleboneai.dtb.
> 
> I tried building an image using the am57xx-evm.conf machine in the first place,
> but it didn't build the wic image,

Well, wic image type can be added to "am57xx-evm" quite easily.


> so I added it to the X15 (since they have the
> same processor). The X15 machine seemed a good place to put it due to the
> similarities. Seemed similar to what is going on in the beaglebone.conf machine
> file (lots of very different boards handled in a single machine file).

Both "beaglebone" and "beagle-x15" machine types and configs were added 
only for user convenience, as it is not very obvious for newcomers that 
beaglebone == am335x-evm and beagle-x15 == am57xx-evm

Unfortunately, neither beaglebone nor beagle-x15 get enough testing attention, 
as they are normally tested as part of am335x-evm and am57xx-evm builds.

Another option considered was to simply have those as symlinks poiting to 
corresponding EVM configs. That would also alleviate the testing deficiency 
mentioned above.


> > Thinking more about this, the defining features of the AI might warrant
> > a new machine conf.
> 
> I'm not opposed to adding a new beagle-ai.conf machine. Looking at

Well, I'm not convinced we need another machine definition that's not 
getting well tested on its own.


> the X15 machine conf, it seems that there would not be much different
> for the BBAI other than possibly MACHINE_GUI_CLASS and SERIAL_CONSOLES.

MACHINE_GUI_CLASS is somewhat outdated - it may have been used by X11 before, 
but right now the only place it's used is in meta-oe linux.inc to control the 
splash screen logo size. We don't use linux.inc from meta-oe anyway.

The difference in SERIAL_CONSOLES is more significant, but X15 uses the same 
UART as AM57 EVM, not sure about AI. Either way, different UARTs can be listed 
in SERIAL_CONSOLES, like we already do for am335x-evm:

+ # Normally AM335 boards use ttyS0, but ICE uses ttyS3, so try both
+ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"


> Any ideas or hints on what would be different in the machine conf for BBAI
> versus the X15?
> 
> I'm also not sure why beagle-x15.conf has UBIFS stuff it it since that board has
> an eMMC nand flash device on it.

Probably cut-n-paste error.

-- 
Denys


> Thanks for the feedback.
> 
> Ted Roth
> 
> >
> > Andrew
> >
> >
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
> > > index d5e05ec7..0af45a84 100644
> > > --- a/conf/machine/beagle-x15.conf
> > > +++ b/conf/machine/beagle-x15.conf
> > > @@ -4,7 +4,10 @@
> > >
> > >  require conf/machine/include/dra7xx.inc
> > >
> > > -KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
> > > +KERNEL_DEVICETREE = " \
> > > +    am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
> > > +    am5729-beagleboneai.dtb \
> > > +"
> > >
> > >  MACHINE_GUI_CLASS = "bigscreen"
> > >
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > >
> > > View/Reply Online (#12591): https://lists.yoctoproject.org/g/meta-ti/message/12591
> > > Mute This Topic: https://lists.yoctoproject.org/mt/69386296/3619733
> > > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [afd@ti.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#12596): https://lists.yoctoproject.org/g/meta-ti/message/12596
> Mute This Topic: https://lists.yoctoproject.org/mt/69386296/1051543
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [denys@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-

