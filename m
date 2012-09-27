Return-Path: <raj.khem@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84AE0E0027E
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 09:11:21 -0700 (PDT)
Received: by eekb45 with SMTP id b45so1153655eek.35
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=41mBEF9l+qPW5s70O6FRyDBJeb12ixrgkfPAom1iIiQ=;
	b=a/bnKhp9A+eE9ubTA4sDsfBVHUq5nimuISzhTF05PUcXpY++yAXWEnmxxRN6ll7aqL
	bBAMS84mlexf/FBo7d5Gt+l1mLy7qqan+kKbrJtY5fHVSK0XAA6bFsVtSl3PfandUsrg
	/PR6pnLueDBiSBT5oMHdD9E19EMdB68mSnegnMLRmBA95njoD4zMuJTzItX6OsT6A6bk
	N69Ua4Bxhkkj0aL6NWOK17ziSUDjfDbD1GJloMReRF9DIslVRKgSUfzfIPsMzgGYGsNE
	nwsaXOsmjElVPVLP9bJFxdPihfKmoAnZa0DQD7t/HJxze3hfJaP7bfVtGHo3VJhwgUqY
	+qgQ==
Received: by 10.14.218.134 with SMTP id k6mr6519810eep.14.1348762280520; Thu,
	27 Sep 2012 09:11:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 27 Sep 2012 09:10:50 -0700 (PDT)
In-Reply-To: <506479FF.8050305@mlbassoc.com>
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com>
	<5062FB00.7080307@mlbassoc.com> <506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
	<506479FF.8050305@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Sep 2012 09:10:50 -0700
Message-ID: <CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 27 Sep 2012 16:11:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 27, 2012 at 9:08 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-09-27 07:55, Khem Raj wrote:
>>
>> On Thu, Sep 27, 2012 at 6:47 AM,  <Christian.Schulenberg@bmw.de> wrote:
>>>
>>> Hi,
>>>
>>> as I wrote before, I have an older version. I used the kernel version of
>>> that one to start up my new meta-ivi build. It crashed later with a kernel
>>> panic, but at least the kernel is running.
>>>
>>> After that I compared the two kernel version I have, with mkimage -l.
>>>
>>> 1. Kernel version that is working quite well:
>>>
>>> mkimage -l uImage
>>> Image Name:   Linux-3.1.0
>>> Created:      Fri Sep 21 11:25:32 2012
>>> Image Type:   ARM Linux Kernel Image (uncompressed)
>>> Data Size:    4144744 Bytes = 4047.60 kB = 3.95 MB
>>> Load Address: 80008000
>>> Entry Point:  80008000
>>>
>>> 2. Kernel version that fails after uncompression:
>>>
>>> mkimage -l uImage
>>> Image Name:   Linux-3.1.0
>>> Created:      Thu Sep 27 07:07:25 2012
>>> Image Type:   ARM Linux Kernel Image (uncompressed)
>>> Data Size:    4176432 Bytes = 4078.55 kB = 3.98 MB
>>> Load Address: 80008000
>>> Entry Point:  80008000
>>>
>>> I don't see any major issues here, so I guess I need to check the
>>> toolchain as proposed by Enrico.
>>>
>>
>> Download denzil SDK for arm which is gcc 4.6 based and compile kernel
>> using that and see if that boots. There could be some kernel+toolchain
>> interaction w.r.t gcc 4.7 which is what is
>> default in current master/(would be 1.3) release, sometimes gcc
>> exposes latent bugs in kernel
>> and at times its wise versa
>
>
> I've tried this kernel on a PandaBoard, built with both GCC-4.7.2 (latest
> master)
> and GCC-4.6.3 (~denzil).  Both fail during to come up.

OK you can take further step back and use edison SDK which has gcc 4.5
which then can _kind_ of eliminate the compiler if it fails with all 3

