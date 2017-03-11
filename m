Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A162AE00A0C; Fri, 10 Mar 2017 21:00:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AA82E00A08
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 21:00:25 -0800 (PST)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 494AF68A019; Sat, 11 Mar 2017 05:00:25 +0000 (GMT)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 9609368A019;
	Sat, 11 Mar 2017 05:00:24 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 232FF674024D;
	Sat, 11 Mar 2017 06:00:24 +0100 (CET)
To: Denys Dmytriyenko <denys@ti.com>, Khem Raj <raj.khem@gmail.com>
References: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
	<20170308170328.GA2586@haswell> <20170311014705.GY578@edge>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <7a87de6c-36a6-2ca0-5a56-1e916b4b0caa@mlbassoc.com>
Date: Sat, 11 Mar 2017 06:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170311014705.GY578@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: Getting TI tools into [host] SDK
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
X-List-Received-Date: Sat, 11 Mar 2017 05:00:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-11 02:47, Denys Dmytriyenko wrote:
> On Wed, Mar 08, 2017 at 09:03:28AM -0800, Khem Raj wrote:
>> On 17-03-08 09:10:18, Gary Thomas wrote:
>>> I'm trying to build a [host] SDK for my target which uses some
>>> TI tools, via -c populate_sdk_ext
>
> Gary,
>
> We don't use -c populate_sdk to produce SDKs. Instead, we still rely on the
> old meta-toolchain mechanism. First, because it can be incorporated into other
> recipes - i.e. we have a recipe that combines rootfs and SDK into one tarball.
> Second, it provides more control to what get's packaged into SDK. Third, it
> doesn't have this undefined magic to packaging stuff - i.e. this post is an
> example of it failing. And only one slight drawback - requires keeping rootfs
> image recipe in sync with meta-toolchain SDK recipe...

As I understand, the meta-toolchain style(s) are deprecated.  Also using the
populate_sdk_ext gets me many improvements such as relocatable tools and 'devtool'

>
>
>>> In particular, I'm using recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
>>> I include ti-cgt-pru-native to use the tools in my bitbake recipes - that works fine.
>>> I include ti-cgt-pru in my target image to get the tools on my board - that also works.
>>>
>>> The problem is that in my SDK, none of the binaries are included, including clpru:
>>>
>>> $ ls -l /home/gthomas/my_ti_sdk/tmp/sysroots/rainier-p8701/usr/share/ti/cgt-pru
>>> total 16
>>> drwxrwxr-x 2 gthomas gthomas 12288 Mar  8 08:22 include
>>> drwxrwxr-x 3 gthomas gthomas  4096 Mar  8 08:22 lib
>>>
>>> I added this to try and include the files:
>>>   TOOLCHAIN_HOST_TASK += "'nativesdk-ti-cgt-pru"
>>> and I can see that there was a nativesdk-ti-cgt-pru built which does have all the
>>> executables included, they just aren't being packaged.
>>>
>>> $ ls tmp/work/x86_64-nativesdk-mysdk-linux/nativesdk-ti-cgt-pru/2.1.4-r0/image/opt/mydistro/2.2+snapshot/sysroots/x86_64-amltdsdk-linux/usr/share/ti/cgt-pru/bin
>>
>> perhaps you need to correct the install location for nativesdk may be
>> via overriding do_install
>
> Why?
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

