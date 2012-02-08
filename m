Return-Path: <jfabernathy@gmail.com>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A156DE004D2
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:11:40 -0800 (PST)
Received: by qauh8 with SMTP id h8so811338qau.14
	for <meta-ti@yoctoproject.org>; Wed, 08 Feb 2012 14:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=dfKEo7WAEyWFF9kgjqogNK5oik0FRAHL3txD89ZJtPI=;
	b=jk/wyfPjGhhmOjFufzTRO/QuCPqH+dX5ccu/KNnvo7qBNHffBMpFy2pZ8zzyB1MlJ5
	Zl8+HhwQx193ZB448KgcpRpx6ogCi+2Hji52XvWG3qe/QITYydErQ0DblSGaL9KvSWy/
	Kn1uCl4Yo8VMsBLqDj9Ug8qDhb8M+mxGhUKNI=
Received: by 10.224.10.19 with SMTP id n19mr8403925qan.68.1328739100127;
	Wed, 08 Feb 2012 14:11:40 -0800 (PST)
Received: from [10.0.1.54] (nc-184-3-54-63.dhcp.embarqhsd.net. [184.3.54.63])
	by mx.google.com with ESMTPS id o8sm1369579qan.11.2012.02.08.14.11.39
	(version=SSLv3 cipher=OTHER); Wed, 08 Feb 2012 14:11:39 -0800 (PST)
Message-ID: <4F32F31B.2000303@gmail.com>
Date: Wed, 08 Feb 2012 17:11:39 -0500
From: jfabernathy <jfabernathy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
In-Reply-To: <4F32F1B3.8090000@mlbassoc.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 22:11:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 05:05 PM, Gary Thomas wrote:
> On 2012-02-08 14:58, jfabernathy wrote:
>> I'm trying to build the pandaboard BSP for Yocto. I cloned the 
>> meta-ti repository in the poky directory and tried to build 
>> core-image-sato for both machine pandaboard and
>> omap4430-panda. However, I immediately get an error because bitbake 
>> is looking for recipes-images/angstrom/systemd-image.bb, which is 
>> required in the ti-hw-bringup-image.bb image
>> recipe.
>>
>> All I really included was the machine name change in local.conf and 
>> added the meta-ti layer in bblayers.conf.
>>
>> Did I miss a step?
>
> This was discussed last week.  Add this line to your local.conf
>   BBMASK = ".*/meta-ti/recipes-misc/"
> This will skip some BeagleBoard/BeagleBone recipes that are not
> currently working in a Yocto tree.
>
Thanks a bunch. That got it going.  The README said nothing, so I'm glad 
you jumped in with this hint.  I just joined the meta-ti mailing list today.

I know I'm going to need a pointer to how to put the yocto image on an 
SDcard.  I would assume it's similar to how you put ubuntu or angstrom??

JIm A



