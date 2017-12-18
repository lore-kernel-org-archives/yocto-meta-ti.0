Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B1D1E00D8C; Mon, 18 Dec 2017 10:08:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7B2BE00D6E
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 10:08:23 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBII8FSt008439;
	Mon, 18 Dec 2017 12:08:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513620495;
	bh=ME4LbSq+5hvCXY/fELw+ZcIuXkYJiFACZwkRM27orCo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mbTFNMSBe1d44VqDPTlEMCKVZFDMhEzszCdz8G1zquv+V17emIoGriPriaif5m8KB
	7dGOkE2ZPkzhlgqf+dKEBHnCvCzuAiex7OttXVJu/LG8VgfaatDonkbMHYfS7bBya9
	y7nLtOT6bNG/9cfVaThZR+bJBlYadF1yREAiQzJ0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBII8FGY011985;
	Mon, 18 Dec 2017 12:08:15 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 18 Dec 2017 12:08:14 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 18 Dec 2017 12:08:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBII8EuG025535;
	Mon, 18 Dec 2017 12:08:14 -0600
Date: Mon, 18 Dec 2017 13:08:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20171218180814.GC4033@edge>
References: <20171128195856.28289-1-JPEWhacker@gmail.com>
	<20171211222857.17997-1-JPEWhacker@gmail.com>
	<20171211223916.GB27197@edge> <1513039988.18435.4.camel@gmail.com>
	<20171215225945.GD361@edge> <1513382968.25932.5.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1513382968.25932.5.camel@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, "Mertz, Timothy" <timothy.mertz@garmin.com>
Subject: Re: [morty][PATCH v2] Make ti-xdctools a native recipe
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
X-List-Received-Date: Mon, 18 Dec 2017 18:08:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Dec 15, 2017 at 06:09:28PM -0600, Joshua Watt wrote:
> On Fri, 2017-12-15 at 17:59 -0500, Denys Dmytriyenko wrote:
> > Thanks, have you tried building anything with this change?
> > 
> > Right off the bat it breaks ipumm-fw, as it expects xdctools to
> > reside in the 
> > same sysroot as BIOS, which is the target one. Fixing it.
> 
> Hmm... thats odd. I'm though we were building the ipumm-fw recipe...
> maybe not though. We are a ways behind on the morty branch right now
> (which is where our patch was based originally). I'll make sure to get
> us up to the HEAD and try it on Monday.
> 
> > Also, I'm making corresponding changes in meta-arago, which uses
> > xdctools as 
> > well. Hopefully there's not much breakage there...
> 
> We don't use much of meta-arago (our distro is poky based), but we do
> "cherry-pick" most of the non-qt based recipes through a rather ugly
> process from meta-arago-extra (I don't know if they all build though).

Latest patches for meta-ti and meta-arago were posted to resolve discussed 
above issues.


> On a side note, optional Qt support in meta-arago would be *greatly*
> appreciated :)

Can you be more specific? Do you have an exact components from meta-arago 
that you want to build w/o Qt?

On the other hand, we only officially support Wayland on our platforms, not 
X11. Thus there are some specific graphics requirements involved - if you are 
trying to build something graphical, it will pull in Qt dependencies...

-- 
Denys

