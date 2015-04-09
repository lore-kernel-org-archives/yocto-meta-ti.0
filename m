Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEAE0E008EC; Thu,  9 Apr 2015 14:57:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49502E0049A
	for <meta-ti@yoctoproject.org>; Thu,  9 Apr 2015 14:57:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t39Lvcrf026629;
	Thu, 9 Apr 2015 16:57:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39Lvbdu006712;
	Thu, 9 Apr 2015 16:57:37 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 16:57:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39Lva5u008648;
	Thu, 9 Apr 2015 16:57:37 -0500
Date: Thu, 9 Apr 2015 17:57:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20150409215736.GE6414@edge>
References: <5525A37A.70503@gmail.com>
	<CAMKF1soSt+BSYq4d8EJnn=S43W3fq3yR-9kGauxqcG8GP_37CA@mail.gmail.com>
	<55267887.80001@gmail.com>
MIME-Version: 1.0
In-Reply-To: <55267887.80001@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: dizzy branch
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
X-List-Received-Date: Thu, 09 Apr 2015 21:57:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 09, 2015 at 09:03:03AM -0400, Trevor Woerner wrote:
> On 15-04-08 07:14 PM, Khem Raj wrote:
> >On Wed, Apr 8, 2015 at 2:54 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> >>Is there going to be a dizzy branch to meta-ti?
> >is some change in OE-core master asking for it ?
> 
> I thought it was traditional to "draw a line in the sand" and say
> "when dizzy was released, this is how this layer looked".
> 
> Having a branch named dizzy, I think, would make it easier to base
> work on a given release. Let's say you release a product based on
> dizzy and a year from now you want to perform a fresh build on a new
> machine for your product. Clone all the required repositories and
> then checkout the dizzy branch in all of them?
> 
> Also, sometimes nobody notices that a change will affect a given
> release until months later. So although nothing is obviously asking
> for it, maybe some changes are causing issues we won't notice until
> months from now?

All good points. But as Khem said, there are no differences between master and 
dizzy/fido from meta-ti perspective. The thing is, we still have few of our 
products based on Daisy and being actively developed, hence I have to maintain 
Daisy as well as master. If you check the logs, you'd notice that I have to 
push same patches to both daisy and master branches (although there were some 
subtle changes between them, due to low-level framework changes in OE-core). 
If you insist on creating dizzy branch, it won't be updated. Which is probably 
fine, as it would be expected to be "stable" w/o new features, but with 
bugfixes. And considering that daisy gets new features, it would be rather 
strange...

BTW, we plan to migrate our products to Fido in the near future, so basically 
we are tracking Spring Yocto releases - Denzil, Dylan, Daisy, Fido, etc. So, 
there will be fido branch at some point and I will stop accepting new features 
into daisy...

-- 
Denys

