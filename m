Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 3FACDE006F6
	for <meta-ti@yoctoproject.org>; Thu, 21 Feb 2013 04:33:44 -0800 (PST)
Message-ID: <51261426.1050809@communistcode.co.uk>
Date: Thu, 21 Feb 2013 12:33:42 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <46F9BF9187AF5A4AA0AEF94A28ADD22488C678@sestoex09.enea.se>
	<512613C9.5040902@communistcode.co.uk>
In-Reply-To: <512613C9.5040902@communistcode.co.uk>
Subject: Re: LICENSE related errors while using meta-ti layer
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 12:33:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/13 12:32, Jack Mitchell wrote:
> On 21/02/13 12:29, Maxin John wrote:
>> Hi,
>>
>> While trying to build core-image-minimal for "hawkboard" using poky
>> and meta-ti layers (master branch), I get the below listed error:
>>
>> :~/master/poky/build$ bitbake core-image-minimal
>> ERROR: This recipe does not have the LICENSE field set 
>> (cloud9-gnome-image)
>> ERROR: This recipe does not have the LICENSE field set (cloud9-image)
>> ERROR: Unable to parse
>> /home/majo/master/poky/meta-ti/recipes-misc/images/cloud9-gnome-image.bb: 
>>
>> Exited with "1"
>> ERROR: This recipe does not have the LICENSE field set 
>> (cloud9-gfx-image)
>> ERROR: This recipe does not have the LICENSE field set 
>> (ti-hw-bringup-image)
>> ERROR: Command execution failed: Exited with 1
>>
>> Is it safe to assume "MIT" LICENSE for these recipes ?
>>
>> Best Regards,
>> Maxin B. John
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>
> Take a look at the README in the meta-ti layer.
>

Appologies it seems the README has been changed. Some of these recipes 
need to be masked in order to get them to build.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


