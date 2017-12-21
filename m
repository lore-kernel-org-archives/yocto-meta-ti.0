Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F047E00E92; Thu, 21 Dec 2017 09:18:42 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92C16E00E82
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 09:18:41 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBLHIek9015513
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 11:18:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513876720;
	bh=TndNs84CFSM32yTygu+gSumBnXHVkepAKcSvKWgYf14=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=raqvQzPGfIOF1bcZS1rvcO+xRks+U67pGC958kJdO89o9AS51ybnIdKi6djh0sIe2
	dZwCaQhUNZ+YHBgsmkE+GEugnMcB9y30AzOomcv2RIg0KkOLFdlJj9viN92NCVpldW
	xaPOdoeFUrN4YDkXtENmeZUIhV4O9SoMhFZ5XEoM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLHIe0a005746
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 11:18:40 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 21 Dec 2017 11:18:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 21 Dec 2017 11:18:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLHIeIX004575;
	Thu, 21 Dec 2017 11:18:40 -0600
Date: Thu, 21 Dec 2017 12:18:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20171221171839.GF5984@edge>
References: <1513281882-44118-1-git-send-email-m-radhakrishnan2@ti.com>
	<20171214200616.GH31492@edge> <20171221160906.GC5984@edge>
	<3d776b07b7a045f28a2b30d62f4ea8aa@ti.com>
MIME-Version: 1.0
In-Reply-To: <3d776b07b7a045f28a2b30d62f4ea8aa@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty/master][PATCH ] ti-ndk: Updating to version 2.26.00.08
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
X-List-Received-Date: Thu, 21 Dec 2017 17:18:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry, I didn't see any other ti-ndk patches on the list. Can you resend?


On Thu, Dec 21, 2017 at 12:17:06PM -0500, Radhakrishnan, Mahesh wrote:
>    Hi Denys,
>     I have resubmitted the patch with -M -C01 option added to the git
>    send-email command.
> 
>    Regards
>    Machu.
>    -----Original Message-----
>    From: Dmytriyenko, Denys
>    Sent: Thursday, December 21, 2017 11:09 AM
>    To: Radhakrishnan, Mahesh
>    Cc: meta-ti@yoctoproject.org
>    Subject: Re: [meta-ti] [morty/master][PATCH ] ti-ndk: Updating to version
>    2.26.00.08
> 
>    Ping
> 
>    On Thu, Dec 14, 2017 at 03:06:17PM -0500, Denys Dmytriyenko wrote:
>    > Please use -C/-M
>    >
>    > On Thu, Dec 14, 2017 at 03:04:42PM -0500, Mahesh Radhakrishnan wrote:
>    > > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>    > > ---
>    > >  recipes-ti/ndk/ti-ndk_2.25.01.11.bb | 13 ------------- 
>    > > recipes-ti/ndk/ti-ndk_2.26.00.08.bb | 13 +++++++++++++
>    > >  2 files changed, 13 insertions(+), 13 deletions(-)  delete mode
>    > > 100644 recipes-ti/ndk/ti-ndk_2.25.01.11.bb
>    > >  create mode 100644 recipes-ti/ndk/ti-ndk_2.26.00.08.bb
>    > >
>    > > diff --git a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
>    > > b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
>    > > deleted file mode 100644
>    > > index d5d926b..0000000
>    > > --- a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
>    > > +++ /dev/null
>    > > @@ -1,13 +0,0 @@
>    > > -require ti-ndk.inc
>    > > -
>    > > -PV = "2_25_01_11"
>    > > -PR = "r0"
>    > > -
>    > > -LIC_FILES_CHKSUM =
>    "file://ndk_${PV}_manifest.html;md5=80a8d9b76cf700929d3f5b6df09052d6"
>    > > -
>    > > -SRC_URI[ndkzip.md5sum] = "e42bfcc8c3a6d183d60f26ec01ccc79b"
>    > > -SRC_URI[ndkzip.sha256sum] =
>    "a15bc9b570dc0628dd8b8c3665037a162610a6f86c5f17ebb6a329d3db60f071"
>    > > -
>    > > -INHIBIT_PACKAGE_STRIP = "1"
>    > > -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>    > > -INHIBIT_SYSROOT_STRIP = "1"
>    > > diff --git a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
>    > > b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
>    > > new file mode 100644
>    > > index 0000000..e587bf9
>    > > --- /dev/null
>    > > +++ b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
>    > > @@ -0,0 +1,13 @@
>    > > +require ti-ndk.inc
>    > > +
>    > > +PV = "2_26_00_08"
>    > > +PR = "r0"
>    > > +
>    > > +LIC_FILES_CHKSUM =
>    "file://ndk_${PV}_manifest.html;md5=e2a7d40cf1e7207ac3dd6d993d71ee8c"
>    > > +
>    > > +SRC_URI[ndkzip.md5sum] = "09c7ffaff305f3083d15c0a0db73d781"
>    > > +SRC_URI[ndkzip.sha256sum] =
>    "5b22c6b8bfbf3a22c53f52bf880d5cf49daf386716942a4202569521bb30f4a8"
>    > > +
>    > > +INHIBIT_PACKAGE_STRIP = "1"
>    > > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>    > > +INHIBIT_SYSROOT_STRIP = "1"
>    > > --
>    > > 1.9.1
>    > >
>    > > --
>    > > _______________________________________________
>    > > meta-ti mailing list
>    > > meta-ti@yoctoproject.org
>    > > https://lists.yoctoproject.org/listinfo/meta-ti
>    > --
>    > _______________________________________________
>    > meta-ti mailing list
>    > meta-ti@yoctoproject.org
>    > https://lists.yoctoproject.org/listinfo/meta-ti

