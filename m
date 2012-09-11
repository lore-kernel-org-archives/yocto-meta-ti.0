Return-Path: <raj.khem@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65445E002AC
	for <meta-ti@yoctoproject.org>; Tue, 11 Sep 2012 10:26:46 -0700 (PDT)
Received: by eekd41 with SMTP id d41so711945eek.35
	for <meta-ti@yoctoproject.org>; Tue, 11 Sep 2012 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=J0MRQDrfrfElZUOBqoUrJnua9nR+T/toJIawCmKSIig=;
	b=yWsXUmpzcCEhdvhH/gWQcnccPIKMDmsFgHe17Q1ZRShWUA8rjcIA/VwwW2XsTuDGIL
	BTei/+8P3NEWbwYAT6RZmFjm4hXAgO3HpPnjdohmc1Mr91nHlPbWaBLP0KH3Qer/K9wq
	wcbqr35mXAQnAujCD4JtAtCeWriMOVXFoyBYt6Q3S2t6utwhR7WnpQjqFxbkMqm4UMhu
	Z342KEG8PgQycDKyIWRY3jRQ7Xb3TiEBEuuLNRE0b5F3Z6khHOgBjPmx35xQtwiITr4B
	c3mRMuOMjUDT3mU7s60OBzbD/QHrlMgbkvVX++KpfGfu9XhtE0bFgEU9U+gPWZIzVA/T
	uXUw==
Received: by 10.14.218.134 with SMTP id k6mr26932668eep.14.1347384405108; Tue,
	11 Sep 2012 10:26:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 11 Sep 2012 10:26:14 -0700 (PDT)
In-Reply-To: <20120911164620.GB5256@denix.org>
References: <1347210467-19332-1-git-send-email-raj.khem@gmail.com>
	<20120911164620.GB5256@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2012 10:26:14 -0700
Message-ID: <CAMKF1sp3mhD_x6jLoZVL4o8YM5rhLPrbM7XqM9jjahmv2WkD7g@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Use 'packagegroup' instead of 'task'
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
X-List-Received-Date: Tue, 11 Sep 2012 17:26:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 11, 2012 at 9:46 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Sun, Sep 09, 2012 at 10:07:47AM -0700, Khem Raj wrote:
>> bring recipes in sync with OE-Core, task bbclass
>> is now replaced by packagegroup.
>>
>> and task recipes are now called packagegroup_something
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-kernel/linux/multi-kernel.inc              |    2 +-
>>  recipes-misc/images/cloud9-gfx-image.bb            |    2 +-
>>  recipes-misc/images/cloud9-gnome-image.bb          |    2 +-
>>  recipes-misc/images/cloud9-image.bb                |    2 +-
>>  recipes-misc/images/ti-hw-bringup-image.bb         |    2 +-
>>  .../packagegroup-ti-drivers.bb}                    |    2 +-
>>  .../packagegroup-ti-test.bb}                       |    2 +-
>>  7 files changed, 7 insertions(+), 7 deletions(-)
>>  rename recipes-misc/{tasks/task-ti-drivers.bb => packagegroup/packagegroup-ti-drivers.bb} (96%)
>>  rename recipes-ti/{tasks/task-ti-test.bb => packagegroup/packagegroup-ti-test.bb} (92%)
>>
>> diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
>> index 04bc987..96d6121 100644
>> --- a/recipes-kernel/linux/multi-kernel.inc
>> +++ b/recipes-kernel/linux/multi-kernel.inc
>> @@ -117,5 +117,5 @@ do_deploy_append () {
>>
>>  }
>>
>> -do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}:do_populate_sysroot"
>> +do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
>
> Why is this changed? Isn't gcc${KERNEL_CCSUFFIX} no longer useful?
>

this should have been a separate commit. Its needed to accompany
http://patchwork.openembedded.org/patch/35151/

> --
> Denys

