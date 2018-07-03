Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58064E01437; Tue,  3 Jul 2018 11:24:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E30DE01158
	for <meta-ti@yoctoproject.org>; Tue,  3 Jul 2018 11:24:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w63IO6eB042247
	for <meta-ti@yoctoproject.org>; Tue, 3 Jul 2018 13:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530642246;
	bh=/42MNjwsLJulFOcDYg684Rcxu3pO72sLFV9BLcZ8X/U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kAOZF5473PYRQIQXoVbPCmY6ErFX7vRI85JCzDqMM1aPbK/6obG1yWV8fgrtBZiKW
	lcGYswy2QT7W8UzwTbM5YqTv4dgQwwytoqvogWV8AylaHDGfHBkKagny2Fl8aSMw3D
	Zldu+GbXgHYSWKMESzoiJcqC5JUa74Z7S/Un10HE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w63IO60I018284
	for <meta-ti@yoctoproject.org>; Tue, 3 Jul 2018 13:24:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 3 Jul 2018 13:24:06 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 3 Jul 2018 13:24:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w63IO5E2030411;
	Tue, 3 Jul 2018 13:24:06 -0500
Date: Tue, 3 Jul 2018 14:23:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20180703182316.GE16981@beryl>
References: <20180703160736.15569-1-dmurphy@ti.com>
	<20180703180134.GD16981@beryl>
	<e17e0b85-3da5-52a8-6fd5-5d2d61d9a93c@ti.com>
MIME-Version: 1.0
In-Reply-To: <e17e0b85-3da5-52a8-6fd5-5d2d61d9a93c@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] u-boot-ti-staging: update to ti2018.02-rc3 tag
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
X-List-Received-Date: Tue, 03 Jul 2018 18:24:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Build breakage - seems to be some sort of race...


On Tue, Jul 03, 2018 at 01:04:30PM -0500, Dan Murphy wrote:
> Breaks the build or breaks the boot because this built fine for the uBoot compilation job.
> 
> Dan
> 
> On 07/03/2018 01:01 PM, Denys Dmytriyenko wrote:
> > This breaks at least am57xx now - I'm investigating...
> > 
> > 
> > On Tue, Jul 03, 2018 at 11:07:35AM -0500, Dan Murphy wrote:
> >> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >> ---
> >>  recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> >> index fc0a10e7..33110c1b 100644
> >> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> >> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> >> @@ -1,7 +1,7 @@
> >>  require u-boot-ti.inc
> >>  
> >> -PR = "r13"
> >> +PR = "r14"
> >>  
> >>  BRANCH = "ti-u-boot-2018.01"
> >>  
> >> -SRCREV = "e1183b1ef6a3dc5d54603f904307bdbae51f22c3"
> >> +SRCREV = "d87d0db0acc533e7f9d2711b9cbe1548c7eb9cf9"
> >> -- 
> >> 2.17.0.582.gccdcbd54c
> >>
> 
> 
> -- 
> ------------------
> Dan Murphy

