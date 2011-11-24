Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37CBAE00735
	for <meta-ti@yoctoproject.org>; Thu, 24 Nov 2011 03:47:54 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id E7CE31660507; Thu, 24 Nov 2011 04:47:51 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 58ADC16601C5;
	Thu, 24 Nov 2011 04:47:51 -0700 (MST)
Message-ID: <4ECE2EE7.6090600@mlbassoc.com>
Date: Thu, 24 Nov 2011 04:47:51 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
References: <4ECDFB92.10203@ts.fujitsu.com> <4ECE25CD.9090105@mlbassoc.com>
	<4ECE2C84.5090202@ts.fujitsu.com>
In-Reply-To: <4ECE2C84.5090202@ts.fujitsu.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: SRC_URI points to local domain:
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
X-List-Received-Date: Thu, 24 Nov 2011 11:47:54 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-11-24 04:37, Rainer Koenig wrote:
> Am 24.11.2011 12:09, schrieb Gary Thomas:
>
>>> $ find -type f | xargs grep SRC_URI | grep "local/"
>>> ./recipes-ti/hdvpss/ti-hdvpss.inc:SRC_URI =
>>> "http://install.source.dir.local/REL.HDVPSS.${PV}.zip"
>>> ./recipes-ti/devtools/ti-cgt6x.inc:SRC_URI =
>>> "http://install.source.dir.local/ti_cgt_c6000_${PVwithdots}_setup_linux_x86.bin;name=cgt6xbin"
>>> ./recipes-ti/devtools/ti-cgt470.inc:SRC_URI =
>>> "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
>
>> Fetch the files yourself and place in your [local] downloads directory (DL_DIR)
>> No need to change the recipe as OE will look there first.
>
> Well, the 2 cgt files I was able to find at TI, but I have no download
> URL for the REL.HDVPSS.${PV}.zip file. :-(

I've no idea about this - I have never built that recipe.

>
> BTW: the version of ti_cgt_c6000... has different md5sums to what is
> written in the recipe. Strange thing.

This is a known problem (see the archives)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

