Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B661E0059B
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:05:42 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 26108F81207; Wed,  8 Feb 2012 15:05:41 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 97CB2F811FC;
	Wed,  8 Feb 2012 15:05:39 -0700 (MST)
Message-ID: <4F32F1B3.8090000@mlbassoc.com>
Date: Wed, 08 Feb 2012 15:05:39 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F32F016.4020008@gmail.com>
In-Reply-To: <4F32F016.4020008@gmail.com>
Subject: Re: building Yocto for Pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 22:05:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-08 14:58, jfabernathy wrote:
> I'm trying to build the pandaboard BSP for Yocto. I cloned the meta-ti repository in the poky directory and tried to build core-image-sato for both machine pandaboard and
> omap4430-panda. However, I immediately get an error because bitbake is looking for recipes-images/angstrom/systemd-image.bb, which is required in the ti-hw-bringup-image.bb image
> recipe.
>
> All I really included was the machine name change in local.conf and added the meta-ti layer in bblayers.conf.
>
> Did I miss a step?

This was discussed last week.  Add this line to your local.conf
   BBMASK = ".*/meta-ti/recipes-misc/"
This will skip some BeagleBoard/BeagleBone recipes that are not
currently working in a Yocto tree.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

