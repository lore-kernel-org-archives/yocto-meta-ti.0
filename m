Return-Path: <jdvdt2@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D307E00BD2; Thu, 17 Dec 2015 05:48:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jdvdt2[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.50 listed in list.dnswl.org]
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1504CE005B7
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 05:48:30 -0800 (PST)
Received: by mail-vk0-f50.google.com with SMTP id a189so46530462vkh.2
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 05:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=N0jhw1GgBlcy349mvmsJ4nmGs48xWjvNIu+6ax1LBA8=;
	b=ko4Y8S9xoAxTHCEspmUTh/9IC2LWelqKykMogc05NqV0ES+w3YB8rR4AhBSAUTPnyW
	vmp1dhYlICsrNWsvryW1b9jiXxgZGWi9VHAuhHRqYTRJQgjtlvb+mfMchFM5M7tVuWqD
	RiZ0f+N/ZLTsDjfgxFJFXa5wkvWRcjHACWYw24T7O6r0vbAY0WPLz+Gjy9QDNUmNCO29
	MSMByyhGyFl0seOHRS5ynBJi/t3epzPZvCOq/HndFqAqViDPio1y8Vk4/GVdhNWpyaQ+
	YoSBeNzdCEk2IPJo8SnBBu4J/rKJ80cRvQyN8Z6UybAfgkKuU/0R0JxRVhYDDPIm9Nf0
	gc4A==
MIME-Version: 1.0
X-Received: by 10.31.140.199 with SMTP id o190mr38128005vkd.63.1450360109697; 
	Thu, 17 Dec 2015 05:48:29 -0800 (PST)
Received: by 10.31.93.69 with HTTP; Thu, 17 Dec 2015 05:48:29 -0800 (PST)
In-Reply-To: <CAAjA2MK=K-iL1-t-=O=h6YmmaOZPj=mdk=zEsCUbaKz1M6d=mQ@mail.gmail.com>
References: <CAAjA2MK=K-iL1-t-=O=h6YmmaOZPj=mdk=zEsCUbaKz1M6d=mQ@mail.gmail.com>
Date: Thu, 17 Dec 2015 08:48:29 -0500
Message-ID: <CAAjA2MLo=YH_Aob1fEZxCgAUM4Yaqwhy4mA3pt6Dc25zZ6cLGg@mail.gmail.com>
From: Joshua Vanderpool <jdvdt2@gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: u-boot update to support TPS650937
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
X-List-Received-Date: Thu, 17 Dec 2015 13:48:38 -0000
X-Groupsio-MsgNum: 7705
Content-Type: multipart/mixed; boundary=001a11425b2022b267052718477f

--001a11425b2022b267052718477f
Content-Type: multipart/alternative; boundary=001a11425b2022b263052718477d

--001a11425b2022b263052718477d
Content-Type: text/plain; charset=UTF-8

sorry, missed the write patch in the board.c that uses the u16 write
function.

On Thu, Dec 17, 2015 at 8:41 AM, Joshua Vanderpool <jdvdt2@gmail.com> wrote:

> I do not know how best to incorporate this update for use in the TI
> mainline but this is the patches we used for our design to make it work.
> This update is needed to write to the DEV_CTRL.DEV_ON register at 0x1A0
> which to write to needed to be byte swapped for the the proper write to the
> register.
>
> Josh
>

--001a11425b2022b263052718477d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">sorry, missed the write patch in the board.c that uses the=
 u16 write function.</div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Thu, Dec 17, 2015 at 8:41 AM, Joshua Vanderpool <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jdvdt2@gmail.com" target=3D"_blank">jdvdt2@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
>I do not know how best to incorporate this update for use in the TI mainli=
ne but this is the patches we used for our design to make it work.=C2=A0 Th=
is update is needed to write to the=C2=A0DEV_CTRL.DEV_ON register at 0x1A0 =
which to write to needed to be byte swapped for the the proper write to the=
 register.<div><br></div><div>Josh</div></div>
</blockquote></div><br></div>

--001a11425b2022b263052718477d--

--001a11425b2022b267052718477f
Content-Type: text/x-patch; charset=US-ASCII; name="raymond-gdm-board.patch"
Content-Disposition: attachment; filename="raymond-gdm-board.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iiaay7su2

LS0tIGdpdC9ib2FyZC90aS9yYXltb25kX2dkbS9ib2FyZC5jCTIwMTUtMTAtMTQgMTQ6MzQ6MjUu
NzE4MzA3OTUxIC0wNDAwCisrKyBnaXQvYm9hcmQvdGkvcmF5bW9uZF9nZG0vYm9hcmRfY29weS5j
CTIwMTUtMTAtMTQgMTQ6MzU6MzYuNDU0MzA3NTQwIC0wNDAwCkBAIC0yNTksMTIgKzI1OSwxMiBA
QCBpbnQgYm9hcmRfaW5pdCh2b2lkKQogCiBpbnQgYm9hcmRfbGF0ZV9pbml0KHZvaWQpCiB7Ci0J
aW5pdF9zYXRhKDApOworCS8vaW5pdF9zYXRhKDApOwogCS8qCiAJICogREVWX0NUUkwuREVWX09O
ID0gMSBwbGVhc2UgLSBlbHNlIHBhbG1hcyBzd2l0Y2hlcyBvZmYgaW4gOCBzZWNvbmRzCiAJICog
VGhpcyBpcyB0aGUgUE9XRVJIT0xELWluLUxvdyBiZWhhdmlvci4KIAkgKi8KLQlwYWxtYXNfaTJj
X3dyaXRlX3U4KFRQUzY1OTAzWF9DSElQX1AxLCAweEEwLCAweDEpOworCXBhbG1hc19pMmNfd3Jp
dGVfdTE2KFRQUzY1OTAzWF9DSElQX1AxLCAweEEwMDEsIDB4MSk7CiAJcmV0dXJuIDA7CiB9CiAK

--001a11425b2022b267052718477f--
