Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5026CE00A73; Tue, 28 Jul 2015 12:12:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E678E00A4C
	for <meta-ti@yoctoproject.org>; Tue, 28 Jul 2015 12:11:56 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6SJBtkf016903
	for <meta-ti@yoctoproject.org>; Tue, 28 Jul 2015 14:11:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6SJBtR6020458
	for <meta-ti@yoctoproject.org>; Tue, 28 Jul 2015 14:11:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Jul 2015 14:11:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6SJBt25026475;
	Tue, 28 Jul 2015 14:11:55 -0500
Date: Tue, 28 Jul 2015 15:11:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150728191139.GJ1040@edge>
References: <1436272155-9491-1-git-send-email-j-stiffler@ti.com>
	<20150707205920.GH11382@edge> <559D00CD.5010606@ti.com>
	<20150709232111.GJ15657@edge> <55B79CCC.70604@ti.com>
MIME-Version: 1.0
In-Reply-To: <55B79CCC.70604@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] ti-sysbios: Add version 6.41.04.54.
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
X-List-Received-Date: Tue, 28 Jul 2015 19:12:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Let me try to simplify... In order to efficiently review patches, I need to 
see the changes between the versions. There are 2 ways to do that:

1. Rename recipe to the new name (git-mv) and make the necessary changes. Then 
git-format-patch a single patch which will only have the actual changes.
This is a preferred way to do version upgrades if you don't need to keep old 
version around and maintain multple versions of the same recipe/component.

2. If you want, you can still do it in 2 patches - add new and remove old one. 
BUT, you should git-format-patch the first one with -C --find-copies-harder 
flags, so it would make the patch with new version *as a diff* against the old 
one, not a completely new one.

Since you already have this version upgrade as 2 commits, you don't need to 
rebase and squash them, just git-format-patch again with correct flags and 
resubmit. Thanks.

-- 
Denys


On Tue, Jul 28, 2015 at 11:16:28AM -0400, Jacob Stiffler wrote:
> Denys,
> 
> Were these not in the correct order? Add new version first, then
> remove the old version, correct?
> 
> Do you want me to resubmit these patch sets??
> 
> - Jake
> 
> On 7/9/2015 7:21 PM, Denys Dmytriyenko wrote:
> >Jake,
> >
> >I think that was one of the long standing confusion - back in OpenEmbedded
> >Classic days removing old version wasn't safe, as it could break someone
> >else's build. So, people were advised to add new version they wanted, but send
> >a separate patch that deleted the old one. If there was someone who used that
> >specific old version, they could object to the second patch. That's why there
> >used to be multiple versions of the same recipes all over the place. Now, with
> >OpenEmbedded Core and the Yocto Project, the normal policy is to keep a single
> >version of each recipe, where possible. Hence, updating recipe version is
> >better done in a single patch, as it allows tracking recipe changes across
> >versions with git log --follow flag. Other than that, I don't remember any
> >other reason why would you want to do a version update in 2 separate patches.
> >My position was always less strict - if you want 2 patches, then at least send
> >them in right order, plus using -C --find-copies-harder flags would help with
> >review, as it wouldn't look like 100% new file...
> >
> 

