Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88AEBE00709
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2013 09:26:42 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1995EF81218; Wed, 13 Mar 2013 10:26:41 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5C1C5F81212;
	Wed, 13 Mar 2013 10:26:41 -0600 (MDT)
Message-ID: <5140A8CE.4050209@mlbassoc.com>
Date: Wed, 13 Mar 2013 10:26:54 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <20130313162332.GA17056@enea.se>
In-Reply-To: <20130313162332.GA17056@enea.se>
Subject: Re: License errors
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
X-List-Received-Date: Wed, 13 Mar 2013 16:26:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-03-13 10:23, Mats Liljegren wrote:
> When I bitbake with meta-ti layer I get the following errors:
>
> ERROR: This recipe does not have the LICENSE field set (cloud9-image)
> ERROR: This recipe does not have the LICENSE field set (cloud9-gfx-image)
> ERROR: This recipe does not have the LICENSE field set (cloud9-gnome-image)
> ERROR: This recipe does not have the LICENSE field set (ti-hw-bringup-image)
> ERROR: Unable to parse
> /media/sdc1/fb/mlil/enea-base/poky/meta-ti/recipes-misc/images/ti-hw-bringup-image.bb: Exited with "1"--:--:--
> ERROR: Command execution failed: Exited with 1
>
> I use master branch for poky as well as for meta-ti.
>
> Is there a fix for this already, or should I create a patch for it? If the
> latter, what license should I use? MIT?

This is discussed in meta-ti/README

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

