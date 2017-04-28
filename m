Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5DEEE009CE; Fri, 28 Apr 2017 11:36:46 -0700 (PDT)
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
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E5BEE009A5
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:36:45 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SIaiQH005727;
	Fri, 28 Apr 2017 13:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493404604;
	bh=G+vT8fluzDHSvKzqhhVsCmmcOcJi6wf/uRsbzgEPYxw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=q23BSBK5oCjt3O3qSM21H41SuN2ny3A9cHopmSFD1bXnaOVOmBmPnz6WSfMyA1gQq
	cIoTaO1RTOi5f2PPBA6mx0gd3TDYC+7qcyTTKyPtDoHxnc0tTEDZOa0ZsK82BPDycb
	48BIKvINnUtz1S+cSsBhTuSXD4I8CKpfD969RH4I=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SIaimF002603;
	Fri, 28 Apr 2017 13:36:44 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 13:36:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SIahH6004638;
	Fri, 28 Apr 2017 13:36:43 -0500
Date: Fri, 28 Apr 2017 14:36:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anton Gerasimov <anton@advancedtelematic.com>
Message-ID: <20170428183642.GP31608@edge>
References: <15a28d2c-ad70-6b82-0acf-8383a8b97b21@advancedtelematic.com>
MIME-Version: 1.0
In-Reply-To: <15a28d2c-ad70-6b82-0acf-8383a8b97b21@advancedtelematic.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: wlcore/wl18xx upstream vs build_wl18xx.sh
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
X-List-Received-Date: Fri, 28 Apr 2017 18:36:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

The best place to ask this is on E2E forum: http://e2e.ti.com/


On Fri, Apr 28, 2017 at 04:11:52PM +0200, Anton Gerasimov wrote:
> Hi all,
> 
> my question is not related directly to meta-ti, but it's the only ti
> developer mailing list I've found. If you know a better place for it,
> please share.
> 
> I've tried to build linux-ti-staging kernel from meta-ti with wl18xx
> support and it kind of works, i.e. I can scan for available networks,
> but can't unfortunately connect to any. I've learned that TI's
> recommended way to build their wireless drivers is via build_wl18xx.sh
> from TI's build_utilities, which uses a bit convoluted procedure ending,
> as far as I could understand, with backporting drivers from TI's own
> kernel branch.
> 
> So I wonder how different these are from the upstream, if it is possible
> that my problems are due to using upstream drivers, and if there is a
> recommended method to install these drivers inside Yocto, without
> post-processing built images.
> 
> Thanks in advance,
> Anton Gerasimov
> 
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

