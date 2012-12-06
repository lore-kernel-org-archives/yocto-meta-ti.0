Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7BE1E01458
	for <meta-ti@yoctoproject.org>; Thu,  6 Dec 2012 05:22:15 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E2FF0F811E1; Thu,  6 Dec 2012 06:22:14 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 45EAEF811DD;
	Thu,  6 Dec 2012 06:22:13 -0700 (MST)
Message-ID: <50C09C0C.3030001@mlbassoc.com>
Date: Thu, 06 Dec 2012 06:22:20 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <alpine.DEB.2.02.1212060806010.20056@oneiric>
In-Reply-To: <alpine.DEB.2.02.1212060806010.20056@oneiric>
Subject: Re: why does omap3.inc include "x-load" but omap4.inc not?
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
X-List-Received-Date: Thu, 06 Dec 2012 13:22:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-12-06 06:12, Robert P. J. Day wrote:
>
>    almost certainly a simple answer to this but in grepping through the
> meta-ti layer for an unrelated reason, i came across this:
>
> conf/machine/include/omap4.inc:EXTRA_IMAGEDEPENDS += "u-boot"
> conf/machine/include/omap3.inc:EXTRA_IMAGEDEPENDS += "u-boot x-load"
>
> which i thought was odd, since i have both a beagle and panda, and
> both of them use TI's x-loader.  so why would omap3.inc specifically
> add x-load as an extra dependency, but not omap4.inc?

Because U-Boot for the OMAP4 contains support for both MLO and U-Boot
using the new "SPL" mode.  Building u-boot will end up building both
the MLO image as well as u-boot.img

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

