Return-Path: <agnel.joel@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3344E006B4
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 23:17:15 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by eyh5 with SMTP id 5so3348259eyh.35
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 23:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=6qbOv2Xi3cJf0wHJ9JJZl/pzl96zSmfVU1T8EwLLzHs=;
	b=i4bGxGE1b1lpZkhOU6QMZnrYt9BCfA7CJkX+ftfu5AU4d60RQEyXAq2EJBdwZHaEYH
	e/rt8UEvJp56sfTmzr5dX+egVDBL7woytR+Q1SjPGxYJPTWS+o+FqLhauMJGbBo2jfNC
	AbuOd2fTypD9llO4ToZD/PTCPi6UFzTkKp0xU=
MIME-Version: 1.0
Received: by 10.223.5.3 with SMTP id 3mr16232130fat.4.1319091434605; Wed, 19
	Oct 2011 23:17:14 -0700 (PDT)
Received: by 10.152.12.136 with HTTP; Wed, 19 Oct 2011 23:17:14 -0700 (PDT)
In-Reply-To: <a0394de50abd4fa391c362a6be4d46ea@DFLE70.ent.ti.com>
References: <1319082770-5589-1-git-send-email-joelagnel@ti.com>
	<a0394de50abd4fa391c362a6be4d46ea@DFLE70.ent.ti.com>
Date: Thu, 20 Oct 2011 01:17:14 -0500
Message-ID: <CAD=GYpYpjUg4M9-7eio56F7uS19=WdZsbEBCpLT+SAbnGDmLDA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailman-Approved-At: Wed, 19 Oct 2011 23:18:12 -0700
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
X-List-Received-Date: Thu, 20 Oct 2011 06:17:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 12:40 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> [added meta-ti list]
>
> Op 20 okt. 2011, om 05:52 heeft Joel A Fernandes het volgende geschreven:
>
>> Pick up uEnv.txt/user.txt U-boot environment files installed in /boot
>
> This doesn't match what the patch does :/

Yes it does

>
>>
>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>> ---
>> classes/sdcard_image.bbclass | =A0 =A04 +++-
>> 1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
>> index ed9d779..c535ad2 100644
>> --- a/classes/sdcard_image.bbclass
>> +++ b/classes/sdcard_image.bbclass
>> @@ -86,8 +86,10 @@ IMAGE_CMD_sdimg () {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 suffix=3Dbin
>> =A0 =A0 =A0 fi
>>
>> + =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/{user.txt,uEnv.txt} ${WORKDIR}/tmp-=
mnt-boot || true
>> +
>> =A0 =A0 =A0 if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix,use=
r.txt,uEnv.txt} ${WORKDIR}/tmp-mnt-boot || true
>> + =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${=
WORKDIR}/tmp-mnt-boot || true
>
> Your patch is effectively a noop, I don't see the value in applying it.
>

There is quite a lot of value in applying it.

I suggest you try to build an image (cloud9 / ti-hw-bringup) and
notice that there is no uEnv.txt in the boot partition.

Thanks,
Joel

