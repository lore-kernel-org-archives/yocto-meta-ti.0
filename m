Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60ECEE00BAB; Mon, 24 Aug 2015 12:39:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 044C5E00927
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:39:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7OJdhNK023561;
	Mon, 24 Aug 2015 14:39:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7OJdh0V020551;
	Mon, 24 Aug 2015 14:39:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 24 Aug 2015 14:39:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7OJdgZ8028238;
	Mon, 24 Aug 2015 14:39:42 -0500
Date: Mon, 24 Aug 2015 15:39:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
Message-ID: <20150824193926.GX6542@edge>
References: <20150818221434.GH6542@edge>
	<2062145486.7469712.1439977584428.JavaMail.yahoo@mail.yahoo.com>
	<20150824192548.GV6542@edge>
MIME-Version: 1.0
In-Reply-To: <20150824192548.GV6542@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
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
X-List-Received-Date: Mon, 24 Aug 2015 19:39:50 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 24, 2015 at 03:25:48PM -0400, Denys Dmytriyenko wrote:
> On Wed, Aug 19, 2015 at 09:46:24AM +0000, Benjamin Bimmermann wrote:
> > Thank you,
> > now my last question for this Topic:
> > When will this new version for 4.1 be realese ?
> > This mounth ? This year? Is there a date approximate date?
> > Is it possible to be involved in the programming of the libgles-omap3 driver ?  
> 
> This work is coming within next few weeks and it will be a replacement for 
> libgles-omap3.

BTW, if you need this for production, I would suggest staying with 3.14 for 
now, as 4.1 and the replacement graphics support in it are rather new and may 
be a bit unstable in the beginning...

-- 
Denys

