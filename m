Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8015BE00571; Wed,  7 Jan 2015 10:52:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EE6EE002F9
	for <meta-ti@yoctoproject.org>; Wed,  7 Jan 2015 10:52:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t07IqHuV022040;
	Wed, 7 Jan 2015 12:52:17 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07IqHm0001390;
	Wed, 7 Jan 2015 12:52:17 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 12:52:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07IqGSL001284;
	Wed, 7 Jan 2015 12:52:17 -0600
Date: Wed, 7 Jan 2015 13:52:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20150107185215.GF4759@edge>
References: <54AD7DF5.1040805@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <54AD7DF5.1040805@pabigot.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: linux-ti-staging broken in oe-core master
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
X-List-Received-Date: Wed, 07 Jan 2015 18:52:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 07, 2015 at 12:41:57PM -0600, Peter A. Bigot wrote:
> The recent churn in how kernel source is managed apparently makes
> meta-ti/linux-ti-staging-3.14 unusable with oe-core master. One
> gets:
> 
> NOTE: make omap2plus_defconfig
> make: *** No rule to make target `omap2plus_defconfig'.  Stop.
> ERROR: oe_runmake failed
> 
> possibly because the source isn't where it used to be.
> 
> Just a FYI.  There's ongoing discussion about this on oe-core 
> (http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg60146.html)
> which TI folks might want to participate in.

Yes, I know, why do you think nightlies have been failing lately?
It was caused by the way git repos are no longer copied to ${S}, but instead 
symlinked from sysroots. RP had mentioned about this change before the 
holidays. But I won't be able to fix it until later this month, though.

-- 
Denys

