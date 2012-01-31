Return-Path: <ml@communistcode.co.uk>
Received: from tinyArch.localdomain (unknown [78.110.170.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF8C6E0030B
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 02:37:05 -0800 (PST)
Received: from [192.168.0.74] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 1DB6622399
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 10:15:58 +0000 (GMT)
Message-ID: <4F27C42A.9090409@communistcode.co.uk>
Date: Tue, 31 Jan 2012 10:36:26 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111224 Thunderbird/9.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <20120131004439.GF2032@denix.org>
In-Reply-To: <20120131004439.GF2032@denix.org>
Subject: Re: meta-ti layer split
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
X-List-Received-Date: Tue, 31 Jan 2012 10:37:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/12 00:44, Denys Dmytriyenko wrote:
> All,
>
> After much debate and further considerations ;) we've decided to split meta-ti
> repository into 2 layers to ease up on inter-layer dependencies and to enable
> additional use cases of building basic BSP images with a very small set of
> layers, only requiring oe-core as a dependency. The proposed split is the
> following:
>
> 1. meta-ti-bsp-core - is the ultra portable layer.  Starting out it will
> contain only recipes-kernel and recipes-bootloader plus necessary machine
> configurations. Depending on the platform, can be as little as basic board
> support.
>
> 2. meta-ti-bsp-extras - provides the full chip functions with perhaps some
> extra constraints. Initialy this will contian support for DSP, Graphics, and
> Wifi. Provides additional board support for peripherals that may require
> software components like DSPBIOS, CodecEngine, gst-ti, firmware etc. Depends
> on meta-ti-bsp-core. In the future, if certain technologies prove themselves
> well portable, we may move them from meta-ti-bsp-extras to meta-ti-bsp-core.
>
> I'll be starting the initial work on this in a separate branch, calling for
> wider review once ready.
>
> Please provide feedback. Thanks.
>

This sounds fantastic. I am looking forward to being able to use an 
officially supported BSP with the Yocto tools (particularly the 
beaglebone!). Will the changes initially go into the meta-ti repo on the 
yocto git or will development start internally and released when deemed 
'ready'?

Regards,
Jack.

