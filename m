Return-Path: <agnel.joel@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3377BE006B4
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 23:31:32 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by eyh5 with SMTP id 5so3358476eyh.35
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 23:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ULe1rAj4EKCCpLMLrsE+SdVXLiTZd+jxJKwhS9JtK3A=;
	b=Q6Eq97c4hxdUwtov+/8Wvhrt8uXO93qJ4HdHsgf45waNo/+3kWuqUtXD5H3b9jaVqG
	ra7xtqmNcGqOzwefnr+c9XaJEJdUML9HYfXZje8ix6fUh/5yYrHMIa/obiUcEjIBsCGb
	sFSxHdv/VsWY3V7exFlsvkPH5hgjwsQL230Kk=
MIME-Version: 1.0
Received: by 10.223.77.77 with SMTP id f13mr8570207fak.19.1319092290967; Wed,
	19 Oct 2011 23:31:30 -0700 (PDT)
Received: by 10.152.12.136 with HTTP; Wed, 19 Oct 2011 23:31:30 -0700 (PDT)
In-Reply-To: <305F348E-A7E6-4F3B-8364-181C593E6682@dominion.thruhere.net>
References: <1319082770-5589-1-git-send-email-joelagnel@ti.com>
	<a0394de50abd4fa391c362a6be4d46ea@DFLE70.ent.ti.com>
	<CAD=GYpYpjUg4M9-7eio56F7uS19=WdZsbEBCpLT+SAbnGDmLDA@mail.gmail.com>
	<305F348E-A7E6-4F3B-8364-181C593E6682@dominion.thruhere.net>
Date: Thu, 20 Oct 2011 01:31:30 -0500
Message-ID: <CAD=GYpYkerkg7RsNLC1F6fVb2c-ZyvBbvaY2j8g0rJLVYousjQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Fernandes,
	Joel A" <joelagnel@ti.com>, "Kridner, Jason" <jdk@ti.com>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] [PATCH meta-ti] sdcard_image: Copy user.txt/uEnv.txt if it exists in /boot
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
X-List-Received-Date: Thu, 20 Oct 2011 06:31:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>>>>
>>>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>>>> ---
>>>> classes/sdcard_image.bbclass | =A0 =A04 +++-
>>>> 1 files changed, 3 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbcla=
ss
>>>> index ed9d779..c535ad2 100644
>>>> --- a/classes/sdcard_image.bbclass
>>>> +++ b/classes/sdcard_image.bbclass
>>>> @@ -86,8 +86,10 @@ IMAGE_CMD_sdimg () {
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 suffix=3Dbin
>>>> =A0 =A0 =A0 fi
>>>>
>>>> + =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/{user.txt,uEnv.txt} ${WORKDIR}/tm=
p-mnt-boot || true
>>>> +
>>>> =A0 =A0 =A0 if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix,u=
ser.txt,uEnv.txt} ${WORKDIR}/tmp-mnt-boot || true
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} =
${WORKDIR}/tmp-mnt-boot || true
>>>
>>> Your patch is effectively a noop, I don't see the value in applying it.
>>>
>>
>> There is quite a lot of value in applying it.
>>
>> I suggest you try to build an image (cloud9 / ti-hw-bringup) and
>> notice that there is no uEnv.txt in the boot partition.
>
> If you're fixing the bug that {1,2,3} will only pick 1, but forget 2,3 th=
en user.txt is still broken. If you're saying uboot.suffix is not in /boot,=
 we need to fix that. Either way, I'm not supposed to be guessing that, you=
 should explain that in the commit message or with comments in the code or =
both.
>

Please let the sdcard class copy the U-boot environment files (as it
originally was) from /boot to the boot partition and not make it
conditional on the presence of anything else.

Joel

