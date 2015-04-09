Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61779E008F6; Thu,  9 Apr 2015 14:40:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 387A4E0079F
	for <meta-ti@yoctoproject.org>; Thu,  9 Apr 2015 14:40:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t39LeL3N007561;
	Thu, 9 Apr 2015 16:40:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39LeJOh007666;
	Thu, 9 Apr 2015 16:40:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 16:40:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39LeJb6019572;
	Thu, 9 Apr 2015 16:40:19 -0500
Date: Thu, 9 Apr 2015 17:40:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20150409214018.GD6414@edge>
References: <55254865.1010209@mlbassoc.com> <20150408153348.GA4753@edge>
	<55254F2E.4040308@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <55254F2E.4040308@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: No USB on BeagleBone White
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
X-List-Received-Date: Thu, 09 Apr 2015 21:40:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 08, 2015 at 09:54:22AM -0600, Gary Thomas wrote:
> On 2015-04-08 09:33, Denys Dmytriyenko wrote:
> >On Wed, Apr 08, 2015 at 09:25:25AM -0600, Gary Thomas wrote:
> >>I need to resurrect my old BeagleBone White and I'm trying to
> >>do it using Poky/Yocto + meta-ti.  I've managed to build and
> >>boot my board, but it detects nothing when something is plugged
> >>into the USB [not OTG/serial-port] port.
> >>
> >>Any ideas what I need to do to get this going?  The board is
> >>pretty useless to me without the extra USB.
> >
> >Which kernel recipe do you use?
> >
> 
> I used the default from meta-ti/master
>   linux-ti-staging/3.14.35-r22e+gitrAUTOINC+b60f54ead7
> 
> I also had an old image left around from last June which was a 3.12.20
> kernel which has the same behaviour.
> 
> I've tried this on both a BeagleBone Black and White (I have
> one of each side-by-side on my desk) and USB does not work
> on either.
> 
> Is there some configuration I'm missing or something?

Can you check that you have these 2 commits in your OE-Core layer:

http://cgit.openembedded.org/openembedded-core/commit/?id=70a695735e0a7d14448f2f5a9986bfe105210a91
http://cgit.openembedded.org/openembedded-core/commit/?id=6aae37c66fb6e7153b829ad860b7e7f94e804bd4

-- 
Denys

