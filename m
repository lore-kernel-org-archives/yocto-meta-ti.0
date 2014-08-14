Return-Path: <dv@pseudoterminal.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09278E004DD; Thu, 14 Aug 2014 13:09:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D7D5E0034B
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 13:09:03 -0700 (PDT)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 0B407334B5;
	Thu, 14 Aug 2014 22:09:01 +0200 (CEST)
Message-ID: <53ED175D.2090502@pseudoterminal.org>
Date: Thu, 14 Aug 2014 22:09:01 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <53ED13BE.2090809@pseudoterminal.org> <20140814200450.GX23523@edge>
In-Reply-To: <20140814200450.GX23523@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: BeagleBone Black , u-boot, and zImage
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
X-List-Received-Date: Thu, 14 Aug 2014 20:09:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2014 10:04 PM, Denys Dmytriyenko wrote:
> On Thu, Aug 14, 2014 at 09:53:34PM +0200, Carlos Rafael Giani wrote:
>> Hello,
>>
>> after building a rootfs for the Beaglebone Black, I see the
>> following files in the deploy folder for the machine:
>>
>> MLO
>> u-boot.img
>> u-boot-spl.bin
>> zImage
>>
>> as well as other symlinks with "-beaglebone" attached to their filenames.
>>
>> What should I copy, the SPL bin, or the .img u-boot binary?
>> Also, u-boot tries to load a uImage, even though a zImage was built.
>> There is also no uEnv.txt file.
>> Do I have to write one to be able to let u-boot load the zImage, or
>> should it work out-of-the-box?
> Depends on the rootfs image you are building. Most images that are based on
> core-image-base will take care of deploying necessary pieces into the rootfs.
> But core-image-minimal is special and very bare-bone, so extra manual steps
> are required.
>
> Regardless of the rootfs image, you'd need MLO and u-boot.img to be located in
> the first FAT partition of your SD card or eMMC flash.
>
> Then, if your rootfs does not already have zImage and the necessary DTB files
> in the /boot directory, you have to place them there (i.e. core-image-minimal)
> and you are ready to boot. All the defaults will work for out-of-the-box in
> this case. No uEnv.txt is necessary, unless you need to do something extra
> special...
>

Oh, I just built core-image-base .

So I should use the .img and not the SPL .bin? I was wondering if the 
SPL bin is a newer binary that will eventually replace the .img one.

But when I use the .img file, it turns out that it tries to load a 
uImage, even though a zImage was built. Simply setting the bootfile env 
var to "zImage" won't work, because the u-boot script will try to boot 
with the incorrect command.

I am trying to rule out that something went wrong in my build, that 
something is wrong in my setup. If I build core-image-base , the 
resulting u-boot.img should automatically load a zImage, not a uImage, 
correct?

