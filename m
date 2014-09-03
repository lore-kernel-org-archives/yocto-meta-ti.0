Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19437E004F5; Wed,  3 Sep 2014 12:35:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C65A2E0049D
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 12:35:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83JZ6Ma002929;
	Wed, 3 Sep 2014 14:35:06 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83JZ6fL028042;
	Wed, 3 Sep 2014 14:35:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 14:35:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83JZ6Pu031112;
	Wed, 3 Sep 2014 14:35:06 -0500
Date: Wed, 3 Sep 2014 15:35:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
Message-ID: <20140903193505.GZ18620@edge>
References: <54064ACC.9020702@phoenixsoftware.it> <20140903015326.GP18620@edge>
	<5406DE8A.90801@phoenixsoftware.it>
MIME-Version: 1.0
In-Reply-To: <5406DE8A.90801@phoenixsoftware.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335X EVMSK kernel problem
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
X-List-Received-Date: Wed, 03 Sep 2014 19:35:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 03, 2014 at 11:25:30AM +0200, Pierluigi Passaro wrote:
> Hi Denys,
> how can I identify "latest known good commit from meta-ti for
> linux-ti-staging"?
> 
> Thanks
> Pierluigi
> 
> On 03/09/2014 03:53, Denys Dmytriyenko wrote:
> >Pierluigi,
> >
> >Try the latest known good commit from meta-ti for linux-ti-staging, as
> >meta-arago AUTOREV's the commit and there were some known regressions in the
> >past few days, that are being looked at now.

You can always look at SRCREV value in meta-ti/recipes-kernel/linux/linux-ti-staging_3.14.bb
Having said that, I just pushed the latest update that supposed to contain the 
necessary fix. Please let me know if you are still having issues. Thanks.

-- 
Denys

