Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 279B7E01423
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 09:04:31 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAKH4Tnv015010;
	Tue, 20 Nov 2012 11:04:29 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAKH4T9P012355;
	Tue, 20 Nov 2012 11:04:29 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 20 Nov 2012 11:04:29 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAKH4TCo021358;
	Tue, 20 Nov 2012 11:04:29 -0600
Date: Tue, 20 Nov 2012 12:04:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-ID: <20121120170429.GC26674@edge>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
	<CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
	<CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
	<CAOd_LFwhgJNzxpRYjX+w32PemaqRZCOPFop0QXeiVSLqMHBhjA@mail.gmail.com>
	<CAOT3mi+VtFO+RteB5C1sBbijMKWzqaFx=povvEDQay+6YdH3eA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOT3mi+VtFO+RteB5C1sBbijMKWzqaFx=povvEDQay+6YdH3eA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: which kernel for pandaboard?
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
X-List-Received-Date: Tue, 20 Nov 2012 17:04:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 20, 2012 at 05:52:32PM +0100, Nicolas Dechesne wrote:
> hi,
> 
> On Tue, Nov 20, 2012 at 3:02 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> 
> > [    0.000000] OMAP4430 ES2.0
> > ....
> > [    2.950775] asoc: omap-hdmi-hifi <-> omap-hdmi-audio-dai mapping ok
> > [    2.958465] u32 classifier
> > [    2.961364]     Actions configured
> > [    2.965332] TCP: cubic registered
> > [    2.969390] NET: Registered protocol family 10
> > [    2.974975] NET: Registered protocol family 17
> > [    2.979858] lib80211: common routines for IEEE802.11 drivers
> > [    2.986053] Registering the dns_resolver key type
> > [    2.991271] VFP support v0.3: implementor 41 architecture 3 part 30
> > variant 9 rev 1
> > [    2.999572] ThumbEE CPU extension supported.
> > [    3.004211] Registering SWP/SWPB emulation handler
> >
> > (stops here)
> >
> > As mentioned before, mainline kernels boot fine on this board, so it
> > appears the meta-ti kernel has problems with at least some non-ES
> > Panda boards.
> >
> > Enrico, can you send me a complete boot log from your system?  Perhaps
> > if I can see which drivers are being initialized after the above
> > message, then we can more easily narrow it down.
> >
> > Also, do you have the display working on your system?  If so, did you
> > have to add any special kernel command line args to select the display
> > format, etc?
> >
> 
> sorry to jump in late... and I just noticed that you are using ES2.0
> revision of 4430 (I didn't notice that so far).
> 
> i can confirm that we have problems on old ES for 4430, in fact that kernel
> seems to be working on ES2.2+.
> 
> we don't have the root cause for that, so anything that you can find would
> certainly be helpful.

I believe Cliff previously mentioned he had EA1 board, which was the first 
batch of Early Adopter board, i.e. pre-production boards, that were given to 
select people. Could that be the problem? And as Nicolas mentions, there are 
some known issues with ES2.0 silicon. I'm wondering if there's any way to 
replace it...

-- 
Denys

