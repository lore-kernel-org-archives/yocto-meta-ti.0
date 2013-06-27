Return-Path: <heroor@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1674EE006E9
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 07:31:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5REVP4f001858
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 09:31:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5REVPIL013030
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 09:31:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 09:31:25 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r5REVNw5007323;	Thu, 27 Jun 2013 09:31:24 -0500
Message-ID: <51CC4CBA.2080109@ti.com>
Date: Thu, 27 Jun 2013 20:01:22 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <20130627101300.GA6299@ti.com>
	<7D46E86EC0A8354091174257B2FED1015961B7AF@DLEE11.ent.ti.com>
	<20130627142318.GK28379@edge>
In-Reply-To: <20130627142318.GK28379@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] recipes-kernel: Add GLSDK specific kernel tree for omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 14:31:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/27/2013 7:53 PM, Denys Dmytriyenko wrote:
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +BRANCH = "master"
>>> +
>>> +# This commit corresponds to ti2013.04.02 release tag
>>
>> Sorry to nit-pick here, but any reason to re-use the tag name from the 
>> linux-ti-staging tree?  The reason I ask is back to it being confusing if I 
>> have two trees with the same tag name (including version) it becomes kind of 
>> confusing.  Especially since this tree is part of the same git.ti.com 
>> project as the other one.  Thoughts?
> 
> Currently, it's just an identical copy of our LCPD tree w/o any patches on 
> top, so it has the same tags and commit IDs...
> 
> One can argue though, if the trees are still the same, what's the reason to 
> create a new recipe so early in advance?

I want to get the basic recipes in place in time for the release. We do
have the option of submitting recipes post the release but I want to
avoid that.

Having the recipes in meta-ti ahead of time allows us to get feedback
_before_ we freeze.

> 
> 
>>> +SRCREV = "f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
>>> +PV = "3.8.13"
>>> +
>>> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>>> a rebuild
>>> +MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
>>
>> Go ahead and reset your append here to a+ gitr${SRCPV}.  No need to start 
>> from f.
>>
>> Thanks for the submission.  Overall looks pretty good, just a few things to 
>> fix up.
> 
> +1 keep up the good work!
> 


