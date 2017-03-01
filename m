Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3EF89E0082A; Wed,  1 Mar 2017 13:18:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1040CE00566
	for <meta-ti@yoctoproject.org>; Wed,  1 Mar 2017 13:18:24 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v21LINg6016663
	for <meta-ti@yoctoproject.org>; Wed, 1 Mar 2017 15:18:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488403103;
	bh=b4Nn69WV06UqoxanC+sAjtxBUgiVoiVXnyytUwJ+wu4=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=UXzD1MLXi6xf+3qKlv5+cIPD4oCd3BSkPPKhZmLxehVBhLlGJ40b0nZG0snatWWDB
	3ZcJdUOkpRIxk4BxQF92UYmhoPMwMdjXv9xwrhKGGuCYSFPDz7dEuCoOrClcQgkcwP
	6K4K/9S4FaUSblptveouh9IK4k91HVK9bRiC+ABg=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v21LINJh012501
	for <meta-ti@yoctoproject.org>; Wed, 1 Mar 2017 15:18:23 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Mar 2017 15:18:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v21LIMKJ010939	for
	<meta-ti@yoctoproject.org>; Wed, 1 Mar 2017 15:18:23 -0600
Date: Wed, 1 Mar 2017 16:18:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20170301211821.GM12614@edge>
References: <20170215202756.GB19009@edge>
MIME-Version: 1.0
In-Reply-To: <20170215202756.GB19009@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Commit notifications
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
X-List-Received-Date: Wed, 01 Mar 2017 21:18:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

...crickets...

Anyway, I moved commit notifications to arago-commits@arago-project.org list. 
In case anybody is interested...

-- 
Denys


On Wed, Feb 15, 2017 at 03:27:57PM -0500, Denys Dmytriyenko wrote:
> All,
> 
> With patches now often being merged to 4 branches (krogoth, morty, morty-next 
> and master), the volume of automatic commit notifications is getting rather 
> high... Do people think I should move those to a separate dedicated list off 
> of main meta-ti list?
> 
> -- 
> Denys
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

