Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72706E0027E
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 09:08:33 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6E353F81206; Thu, 27 Sep 2012 10:08:28 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8804DF81205;
	Thu, 27 Sep 2012 10:08:27 -0600 (MDT)
Message-ID: <506479FF.8050305@mlbassoc.com>
Date: Thu, 27 Sep 2012 10:08:31 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com> <5062FB00.7080307@mlbassoc.com>
	<506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
In-Reply-To: <CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Thu, 27 Sep 2012 16:08:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2012-09-27 07:55, Khem Raj wrote:
> On Thu, Sep 27, 2012 at 6:47 AM,  <Christian.Schulenberg@bmw.de> wrote:
>> Hi,
>>
>> as I wrote before, I have an older version. I used the kernel version of that one to start up my new meta-ivi build. It crashed later with a kernel panic, but at least the kernel is running.
>>
>> After that I compared the two kernel version I have, with mkimage -l.
>>
>> 1. Kernel version that is working quite well:
>>
>> mkimage -l uImage
>> Image Name:   Linux-3.1.0
>> Created:      Fri Sep 21 11:25:32 2012
>> Image Type:   ARM Linux Kernel Image (uncompressed)
>> Data Size:    4144744 Bytes = 4047.60 kB = 3.95 MB
>> Load Address: 80008000
>> Entry Point:  80008000
>>
>> 2. Kernel version that fails after uncompression:
>>
>> mkimage -l uImage
>> Image Name:   Linux-3.1.0
>> Created:      Thu Sep 27 07:07:25 2012
>> Image Type:   ARM Linux Kernel Image (uncompressed)
>> Data Size:    4176432 Bytes = 4078.55 kB = 3.98 MB
>> Load Address: 80008000
>> Entry Point:  80008000
>>
>> I don't see any major issues here, so I guess I need to check the toolchain as proposed by Enrico.
>>
>
> Download denzil SDK for arm which is gcc 4.6 based and compile kernel
> using that and see if that boots. There could be some kernel+toolchain
> interaction w.r.t gcc 4.7 which is what is
> default in current master/(would be 1.3) release, sometimes gcc
> exposes latent bugs in kernel
> and at times its wise versa

I've tried this kernel on a PandaBoard, built with both GCC-4.7.2 (latest master)
and GCC-4.6.3 (~denzil).  Both fail during to come up.

The next step would be to diagnose this with a JTAG.  Sadly, I've not been able
to get my XDS100v2 to work with the PandaBoard yet, so it'll have to be someone
else to carry this torch.

>
>> Christian
>>
>> -----Ursprüngliche Nachricht-----
>> Von: ebutera@gmail.com [mailto:ebutera@gmail.com] Im Auftrag von Enrico
>> Gesendet: Donnerstag, 27. September 2012 14:07
>> An: Schulenberg Christian, EI-42
>> Cc: meta-ti@yoctoproject.org
>> Betreff: Re: [meta-ti] pandaboard not booting
>>
>> On Thu, Sep 27, 2012 at 1:16 PM,  <Christian.Schulenberg@bmw.de> wrote:
>>> I'm using the same kernel version as I did before. It's the default kernel 3.1 as configured in the meta-ti layer: ti-ubuntu-3.1.0-1282.11, Revision: a5c60c099296fcfc0c8fa8085c40883971486512
>>>
>>> Do you really think it makes sense to switch to a more recent one?
>>
>> No, but i have no better ideas right now...
>>
>> You could check if it's a known toolchain bug with that kernel, but i
>> think it would be faster to try a newer kernel (from the same
>> repository, ti ubuntu integration).
>>
>> Enrico
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

