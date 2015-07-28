Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF14CE0099A; Tue, 28 Jul 2015 08:16:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 524D2E00985
	for <meta-ti@yoctoproject.org>; Tue, 28 Jul 2015 08:16:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6SFGT58009175
	for <meta-ti@yoctoproject.org>; Tue, 28 Jul 2015 10:16:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6SFGT50032579
	for <meta-ti@yoctoproject.org>; Tue, 28 Jul 2015 10:16:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Jul 2015 10:16:28 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6SFGSMg021952;
	Tue, 28 Jul 2015 10:16:28 -0500
Message-ID: <55B79CCC.70604@ti.com>
Date: Tue, 28 Jul 2015 11:16:28 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1436272155-9491-1-git-send-email-j-stiffler@ti.com>
	<20150707205920.GH11382@edge> <559D00CD.5010606@ti.com>
	<20150709232111.GJ15657@edge>
In-Reply-To: <20150709232111.GJ15657@edge>
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
X-List-Received-Date: Tue, 28 Jul 2015 15:16:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Were these not in the correct order? Add new version first, then remove 
the old version, correct?

Do you want me to resubmit these patch sets??

- Jake

On 7/9/2015 7:21 PM, Denys Dmytriyenko wrote:
> Jake,
>
> I think that was one of the long standing confusion - back in OpenEmbedded
> Classic days removing old version wasn't safe, as it could break someone
> else's build. So, people were advised to add new version they wanted, but send
> a separate patch that deleted the old one. If there was someone who used that
> specific old version, they could object to the second patch. That's why there
> used to be multiple versions of the same recipes all over the place. Now, with
> OpenEmbedded Core and the Yocto Project, the normal policy is to keep a single
> version of each recipe, where possible. Hence, updating recipe version is
> better done in a single patch, as it allows tracking recipe changes across
> versions with git log --follow flag. Other than that, I don't remember any
> other reason why would you want to do a version update in 2 separate patches.
> My position was always less strict - if you want 2 patches, then at least send
> them in right order, plus using -C --find-copies-harder flags would help with
> review, as it wouldn't look like 100% new file...
>


