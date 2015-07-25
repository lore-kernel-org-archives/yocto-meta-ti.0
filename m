Return-Path: <sivagopi715@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C305E00A3C; Sat, 25 Jul 2015 02:35:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (sivagopi715[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA5FAE00995
	for <meta-ti@yoctoproject.org>; Sat, 25 Jul 2015 02:35:49 -0700 (PDT)
Received: by oihq81 with SMTP id q81so30896557oih.2
	for <meta-ti@yoctoproject.org>; Sat, 25 Jul 2015 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=2PwFfXvLqSzxypCF9oNbW0Y30fs+FRmPVSAYj64//so=;
	b=DVrez6T11fQhHAaYDRIHFZRO34yvvuAP5TIpiMWv4l3LsBgal5KFP7VnfUZ+5oEYLW
	CKxZjHY7uomMBMM8ePD5rhFkDFl7m482kq2XXSRSl+3sV+hxnBg5UdsGxHjz7gmidxAC
	4LMZvqk79OZlcG49S4af1vY51etL+hdFg6EnHsp5audvNhPyD4e00FNHxCyL1nG0ke/J
	0LTF0uox560gwFTKBEVJUACR8bj4rY1fUIHDpgJFDnnPdkfGpg04J0LNKvzcbq9eCTpV
	zVTwBF0JAjMgZI44+5qnlhAnvVqYiUAsraON/YF4kgUM1gywAkIam0n1is1swk6N2DPV
	TkIA==
MIME-Version: 1.0
X-Received: by 10.202.79.11 with SMTP id d11mr18112753oib.120.1437816948933;
	Sat, 25 Jul 2015 02:35:48 -0700 (PDT)
Received: by 10.202.222.65 with HTTP; Sat, 25 Jul 2015 02:35:48 -0700 (PDT)
Message-ID: <CAK88ezGUw7xSFSQhssxTQCKOb4S4duEKw1TCZmo-btUVJNx2wQ@mail.gmail.com>
From: sivagopiraju kudeti <sivagopi715@gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: Yocto linux rebuild issue
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
Date: Sat, 25 Jul 2015 09:35:54 -0000
X-Original-Date: Sat, 25 Jul 2015 15:05:48 +0530
X-List-Received-Date: Sat, 25 Jul 2015 09:35:54 -0000
Content-Type: multipart/alternative; boundary=001a113d80947e4983051bafd8dd

--001a113d80947e4983051bafd8dd
Content-Type: text/plain; charset=UTF-8

Hi YoctoProject team,

     I have downloaded and compiled the yocto source (kernel version 3.1.0)
for my pandaboard, as the instructions given in  URL (
https://maniacbug.wordpress.com/2012/08/03/pandayocto/). So , pandaboard is
came up, its good to me.

      But, i have modified the .config under
directory(tmp/work/pandaboard-poky-linux-gnueabi/linux-omap4-3.1.0-r0/git)
as per my requirement. So, i need to recompile the kernel using the BITBAKE.

       i have tried with "bitbake -c compile -f virtual/kernel" but its not
working, i understand that it is going to take the .bb file from
"meta/recipes-kernel/linux/linux-dummy.bb". But the actual path is
"meta-ti/recipes-kernel/linux/linux-omap4_3.1.0.bb" and moreover i have
modified the defconfig under
"meta-ti/recipes-kernel/linux/linux-omap4_3.1.0/pandaboard/defconfig/".

       So, I need to compile the kernel with bitbake after modifying the
defconfig file. And i need some bitbake instructions too for to compile
newly included meta-xxx  directory. Please reply for this mail, thanks in
advance.

Thanks,
Gopi.

--001a113d80947e4983051bafd8dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hi YoctoProject team,<br><br=
></div>=C2=A0=C2=A0=C2=A0=C2=A0 I have downloaded and compiled the yocto so=
urce (kernel version 3.1.0) for my pandaboard, as the instructions given in=
=C2=A0 URL (<a href=3D"https://maniacbug.wordpress.com/2012/08/03/pandayoct=
o/">https://maniacbug.wordpress.com/2012/08/03/pandayocto/</a>). So , panda=
board is came up, its good to me.<br><br></div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 But, i have modified the .config under directory(tmp/work/pandaboard-po=
ky-linux-gnueabi/linux-omap4-3.1.0-r0/git) as per my requirement. So, i nee=
d to recompile the kernel using the BITBAKE.<br>=C2=A0<br></div>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 i have tried with &quot;bitbake -c compile -f v=
irtual/kernel&quot; but its not working, i understand that it is going to t=
ake the .bb file from &quot;meta/recipes-kernel/linux/<a href=3D"http://lin=
ux-dummy.bb">linux-dummy.bb</a>&quot;. But the actual path is &quot;meta-ti=
/recipes-kernel/linux/<a href=3D"http://linux-omap4_3.1.0.bb">linux-omap4_3=
.1.0.bb</a>&quot; and moreover i have modified the defconfig under &quot;me=
ta-ti/recipes-kernel/linux/linux-omap4_3.1.0/pandaboard/defconfig/&quot;.<b=
r><br></div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 So, I need to compile the =
kernel with bitbake after modifying the defconfig file. And i need some bit=
bake instructions too for to compile newly included meta-xxx=C2=A0 director=
y. Please reply for this mail, thanks in advance. <br><br></div>Thanks,<br>=
</div>Gopi.<br></div>

--001a113d80947e4983051bafd8dd--
