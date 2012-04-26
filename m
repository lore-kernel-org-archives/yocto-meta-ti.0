Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55ED3E00596
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2012 16:04:28 -0700 (PDT)
Received: from [192.168.0.2] (host86-133-47-66.range86-133.btcentralplus.com
	[86.133.47.66]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 72C8F9ADE
	for <meta-ti@yoctoproject.org>; Fri, 27 Apr 2012 00:04:27 +0100 (BST)
Message-ID: <4F99D47A.9030300@r-finger.com>
Date: Fri, 27 Apr 2012 00:04:26 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120329 Icedove/10.0.3
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F99ABC7.9080807@r-finger.com>
	<D71943B7-3840-49F0-B184-9D5666C43F19@dominion.thruhere.net>
In-Reply-To: <D71943B7-3840-49F0-B184-9D5666C43F19@dominion.thruhere.net>
Subject: Re: egl on beagleboard xM
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
X-List-Received-Date: Thu, 26 Apr 2012 23:04:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/04/12 23:40, Koen Kooi wrote:
> 
> Op 26 apr. 2012, om 22:10 heeft Tomas Frydrych het volgende geschreven:
> 
>> Hi,
>>
>> I am trying to get native egl (i.e., without X) working on Beagleboard
>> xM, but without much success. I am using libgles-omap3 (4.05.00.03) the
>> kernel(s) and sgx drivers from meta-ti master; everything appears to
>> start fine (i.e., no errors reported from pvr-init or dmesg), but trying
>> run any of the gles tests / demos gives:
>>
>>  'eglInitialize' returned egl error 'EGL_BAD_ALLOC' (0x3003)
>>
>> I have tried both linux-omap 2.6.39 and linux 3.0.8, with same results.
> 
> Both of those aren't the default, so are you actually using meta-ti?!?

Hm, so which is meant to be the 'right' beagleboard kernel? The default
virtual provider in meta-ti beagleboard.conf is linux-omap, and based on
the priorities it seems to work out that 2.6.39 is the preferred
version. I am quite happy to try yet a different kernel, of course :)

(I am only using the kernel and related recipes from meta-ti.)

Tomas

