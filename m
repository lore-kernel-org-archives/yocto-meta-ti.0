Return-Path: <bowu86@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A49FE00B7C; Sun, 25 May 2014 14:45:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bowu86[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.52 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 419 seconds by postgrey-1.32 at yocto-www;
	Sun, 25 May 2014 14:45:40 PDT
Received: from mail-qg0-f52.google.com (unknown [209.85.192.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B0B9E009D1
	for <meta-ti@yoctoproject.org>; Sun, 25 May 2014 14:45:40 -0700 (PDT)
Received: by mail-qg0-f52.google.com with SMTP id a108so10980243qge.39
	for <meta-ti@yoctoproject.org>; Sun, 25 May 2014 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yWIZ+mdjwzR5HbplkG7lm9YnzzBoFqKyfxVk4xq4MWo=;
	b=cLuhwm1JrJZ+zbYvTf7tq2HjaoBq5D/AKBlkq26SWyrzdXd4O9D+cZ5gvPOyikMSJS
	DEGwHT1ULYHLioJNSLML+LWZqvDY94M6zp6pvlmkiVhVLHmWXBkDjbDh7sOvD1jFtQxF
	2FeomWm8qt7Rf8vAgGtYqGOiYCSUjTAJnGjC6ZMeCxbi9e6XeUyTDlA5lrxnNq0rYuBH
	ujTm+mpTBjurBOYGxSFGvLquOHewFDG3ezYPUNI9nrwetrFnz5KJpZAgrdDeDnb6PTG0
	ravrioq8nUFbeIV3MrZeNLPRUk7SsGPvM+QQL3+cCK1oO0nDiEVtC2aBSWSaipynK99q
	YhiA==
MIME-Version: 1.0
X-Received: by 10.224.43.211 with SMTP id x19mr27067097qae.17.1401053920925;
	Sun, 25 May 2014 14:38:40 -0700 (PDT)
Received: by 10.229.39.138 with HTTP; Sun, 25 May 2014 14:38:40 -0700 (PDT)
Date: Sun, 25 May 2014 17:38:40 -0400
Message-ID: <CAAOg-bPGfMddJCfpr7z07eHpUK96HPdwEEPzDXSOEX+yVEcX6Q@mail.gmail.com>
From: Bo Wu <bowu86@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Patch error of meta-ti layer in building process
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
X-List-Received-Date: Sun, 25 May 2014 21:45:44 -0000
Content-Type: multipart/alternative; boundary=047d7bf0da3e449ebf04fa40494a

--047d7bf0da3e449ebf04fa40494a
Content-Type: text/plain; charset=UTF-8

Hi,

We are trying to build a yocto image for image processing with e-cam
support. For this, we downloaded the meta-ecam layer and meta-ti layer from
https://github.com/jumpnow/meta-ti.

However when building the image by the command

bitbake ecam-console-image

The building process ran into error...

ERROR: Command Error: exit status: 1  Output:
Applying patch ienc1.patch
can't find file to patch at input line 4
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff -ru dmai/packages/ti/sdo/dmai/ce/Ienc1.c
dmai.new/packages/ti/sdo/dmai/ce/Ienc1.c
|--- dmai/packages/ti/sdo/dmai/ce/Ienc1.c    2013-08-06 08:57:41.000000000
-0700
|+++ dmai.new/packages/ti/sdo/dmai/ce/Ienc1.c    2013-08-23
09:32:14.855847975 -0700
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 36
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff -ru dmai/packages/ti/sdo/dmai/ce/Ienc1.h
dmai.new/packages/ti/sdo/dmai/ce/Ienc1.h
|--- dmai/packages/ti/sdo/dmai/ce/Ienc1.h    2013-08-06 08:57:41.000000000
-0700
|+++ dmai.new/packages/ti/sdo/dmai/ce/Ienc1.h    2013-08-23
09:39:45.218186154 -0700
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch ienc1.patch does not apply (enforce with -f)

Looks like the patch file could not find the file to patch... Also I could
not find anything about patching in ti-dmai_svn.bb, so really confused
about there this patch comes from. Any one had similar problem before?
Really appreciate any suggestions.

Best,
Bo

--047d7bf0da3e449ebf04fa40494a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,</div><div><br></div><div>We are trying to bu=
ild a yocto image for image processing with e-cam support. For this, we dow=
nloaded the meta-ecam layer and meta-ti layer from</div><div><a href=3D"htt=
ps://github.com/jumpnow/meta-ti">https://github.com/jumpnow/meta-ti</a>.</d=
iv>
<div><br></div><div>However when building the image by the command</div><di=
v><br></div><div>bitbake ecam-console-image</div><div><br></div><div>The bu=
ilding process ran into error...</div><div><br></div><div>ERROR: Command Er=
ror: exit status: 1 =C2=A0Output:</div>
<div>Applying patch ienc1.patch</div><div>can&#39;t find file to patch at i=
nput line 4</div><div>Perhaps you used the wrong -p or --strip option?</div=
><div>The text leading up to this was:</div><div>--------------------------=
</div>
<div>|diff -ru dmai/packages/ti/sdo/dmai/ce/Ienc1.c</div><div>dmai.new/pack=
ages/ti/sdo/dmai/ce/Ienc1.c</div><div>|--- dmai/packages/ti/sdo/dmai/ce/Ien=
c1.c =C2=A0 =C2=A02013-08-06 08:57:41.000000000</div><div>-0700</div><div>|=
+++ dmai.new/packages/ti/sdo/dmai/ce/Ienc1.c =C2=A0 =C2=A02013-08-23</div>
<div>09:32:14.855847975 -0700</div><div>--------------------------</div><di=
v>No file to patch. =C2=A0Skipping patch.</div><div>1 out of 1 hunk ignored=
</div><div>can&#39;t find file to patch at input line 36</div><div>Perhaps =
you used the wrong -p or --strip option?</div>
<div>The text leading up to this was:</div><div>--------------------------<=
/div><div>|diff -ru dmai/packages/ti/sdo/dmai/ce/Ienc1.h</div><div>dmai.new=
/packages/ti/sdo/dmai/ce/Ienc1.h</div><div>|--- dmai/packages/ti/sdo/dmai/c=
e/Ienc1.h =C2=A0 =C2=A02013-08-06 08:57:41.000000000</div>
<div>-0700</div><div>|+++ dmai.new/packages/ti/sdo/dmai/ce/Ienc1.h =C2=A0 =
=C2=A02013-08-23</div><div>09:39:45.218186154 -0700</div><div>-------------=
-------------</div><div>No file to patch. =C2=A0Skipping patch.</div><div>1=
 out of 1 hunk ignored</div>
<div>Patch ienc1.patch does not apply (enforce with -f)</div><div><br></div=
><div>Looks like the patch file could not find the file to patch... Also I =
could not find anything about patching in <a href=3D"http://ti-dmai_svn.bb"=
>ti-dmai_svn.bb</a>, so really confused about there this patch comes from. =
Any one had similar problem before? Really appreciate any suggestions.</div=
>
</div><div><br></div><div>Best,</div><div>Bo</div><div><br></div></div>

--047d7bf0da3e449ebf04fa40494a--
