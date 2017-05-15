Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03762E00B05; Mon, 15 May 2017 09:53:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8623FE00AF0
	for <meta-ti@yoctoproject.org>; Mon, 15 May 2017 09:53:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4FGrFKc006092;
	Mon, 15 May 2017 11:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494867195;
	bh=GmcF2RetNkvvxsxOIHCz28dcquTrRhh6dCQlJyqR8zk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZqPwG0gKXwIdRN2tTPmHDPIAVp6rp5908jh1wuRzUqEQOBKbm2yYxpQlnhJ5+Uqg8
	J8bNFA4hRzgc6QuxZw/NlO/zCsgacUpucU5rUDLnjT83glSIYRbptGu0vLreysvhMY
	4ckPp5eN5AWJ+ePQUTNQWgrg3syo9KUucillly54=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4FGrFlB019211;
	Mon, 15 May 2017 11:53:15 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 15 May 2017 11:53:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4FGrEoS005817;
	Mon, 15 May 2017 11:53:14 -0500
Date: Mon, 15 May 2017 12:53:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <niko.mauno@vaisala.com>
Message-ID: <20170515165313.GO32329@edge>
References: <8d0c6267-8282-886d-cc0b-8c1a82ff036b@vaisala.com>
MIME-Version: 1.0
In-Reply-To: <8d0c6267-8282-886d-cc0b-8c1a82ff036b@vaisala.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [master][PATCH 2/3] layer.conf: update with "doxygen" host tool dependency for openmp-rtos
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
X-List-Received-Date: Mon, 15 May 2017 16:53:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 15, 2017 at 11:13:38AM +0000, niko.mauno@vaisala.com wrote:
>  > From: Denys Dmytriyenko <denys at ti.com>
>  >
>  > Also, drop host tool for CCS, as it no longer provided.
>  >
>  > Signed-off-by: Denys Dmytriyenko <denys at ti.com>
>  > ---
>  >  conf/layer.conf | 4 ++--
>  >  1 file changed, 2 insertions(+), 2 deletions(-)
>  >
>  > diff --git a/conf/layer.conf b/conf/layer.conf
>  > index b59effa..87a28de 100644
>  > --- a/conf/layer.conf
>  > +++ b/conf/layer.conf
>  > @@ -28,5 +28,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>  >      multiprocmgr \
>  >  "
>  >
>  > -# Required by CCS installer
>  > -HOSTTOOLS += "unzip"
>  > +# Required by openmp-rtos "docs" target
>  > +HOSTTOOLS += "doxygen"
>  > --
>  > 2.7.4
> 
> Please consider using alternative approach to native doxygen 
> requirement, such as DEPENDS += "doxygen-native" in associated recipes, 

Won't work, as oe-core doesn't have doxygen:
https://lists.yoctoproject.org/pipermail/meta-ti/2017-March/009842.html


> or change to HOSTTOOLS_NONFATAL += "doxygen" here. Otherwise this change 
> breaks builds on hosts which do not have doxygen installed.

Yes, noticed it as well - should have been NONFATAL...

-- 
Denys

