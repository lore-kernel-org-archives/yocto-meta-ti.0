Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C831AE00C54; Mon, 30 Apr 2018 18:00:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5F4EE00C40
	for <meta-ti@yoctoproject.org>; Mon, 30 Apr 2018 18:00:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w41106wT001762;
	Mon, 30 Apr 2018 20:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1525136406;
	bh=teKO756jbPgreGNRizTQ9iy6UEndLaKxgRD9uY/DzPM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lfA9xSkuB9rKWGE+GWYOFRePHIuS431LG6YLXyrH+zskAFhlXHKCu0L9LZBQskRBW
	VKA5oeo06Xb8NjJyyibL+lcUdhm0lVDFR5UJaJkDss59F/TK2NcIXPHZASElNXn5PB
	rJ8cldvFG+pQcDLXsjdlEW6iNdGxN1lJHn8K6nbE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w411052T012457;
	Mon, 30 Apr 2018 20:00:06 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 30 Apr 2018 20:00:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 30 Apr 2018 20:00:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w41105uD004620;
	Mon, 30 Apr 2018 20:00:05 -0500
Date: Mon, 30 Apr 2018 21:00:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Kirk Sutherland <kirk.sutherland@apisensor.com>
Message-ID: <20180501010004.GA24094@edge>
References: <BN6PR04MB1044647DA248BB275122B4A0E48D0@BN6PR04MB1044.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB1044647DA248BB275122B4A0E48D0@BN6PR04MB1044.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: cmem.c fails to compile
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
X-List-Received-Date: Tue, 01 May 2018 01:00:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Couple questions:

1. Any specific reason for gstreamer-ti? It has been deprecated long time ago.

2. Which gcc and what version? We've been using cmem for years w/o problems. 
If using gcc from oe-core, is it the same branch - i.e. krogoth?

-- 
Denys


On Fri, Apr 27, 2018 at 05:36:43PM +0000, Kirk Sutherland wrote:
> Hi,
> 
> 
> I've been trying to build gstreamer-ti from the fido or krogoth branch of 
> the gumstix/yocto manifest but ran into issues with the meta-ti parts. I can 
> build the standard console and gumstix images just fine, but when try to 
> bitbake gstreamer-ti I get:
> 
> 
> cmem.c:38:19: fatal error: stdio.h: no such file or directory
> 
> 
> I'm running it on a 32 bit system and as far as I can tell all the required 
> libraries for gcc are there, it does make me think it could be related to 
> this more recent issue with gcc 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129 but I'm not really sure 
> what is happening here. Any pointers as to how to get this to work or what 
> branch does work would be greatly appreciated.

