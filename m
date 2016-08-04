Return-Path: <cflitjes@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A724E00E68; Thu,  4 Aug 2016 01:07:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cflitjes[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0699BE00E3C
	for <meta-ti@yoctoproject.org>; Thu,  4 Aug 2016 01:07:36 -0700 (PDT)
Received: by mail-wm0-f52.google.com with SMTP id o80so367630251wme.1
	for <meta-ti@yoctoproject.org>; Thu, 04 Aug 2016 01:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=YjyUqRUTGBE5mRujPTq7iOSR3gJOI1KV6ogF9nCVTbY=;
	b=ggcdALQgyv8Ttfiq20bFc8P4c8ldjxgxsN8auWK2aMbDVN5KVvjcGBhEZ73gPIED7o
	nF06bPR/m/VFxfV3E23yOPNBeSCemoBBfwCQr9xdIancRwY747wC+OE66Zm8uH+7+yRu
	8l8mCyoW160S9ILCMmpZLxIYxTJXMjdCQklIQUnb4KYVTiOfU1KOkE8yUlwGWhFbVZCb
	uq5F1UZKrU/2lzt8u4i0ttgajWqsaYcU0br6hYLRIlf3nOp3mlJoju8vGwv/Zz7BNZSW
	agEe1Rr/eyvjLyYoR0nf5Tw273SwyM81+/NOzduZllL42LKN4kqJ+mdJoLPsKXDLvmXg
	LTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=YjyUqRUTGBE5mRujPTq7iOSR3gJOI1KV6ogF9nCVTbY=;
	b=DjDCsvsyk+bU/ZJ5apQxui+4eg3Pws1SBBePc/11XSAZv+rUwa9DRZe8gTxfK5LZZo
	2ZIFgkL++BWeD652k4zSz4gTVHpP39k933fmZlZCKdu+Iq/mnUZiuEXysAAWT5xjgZHe
	oz20m350ebDV8MyUAeeKlyEht4lWRAyc3fwFCTZzfUObr6Iy9hcQ38W0QTm1XrHOpcWg
	fTJCbsxyRqwtf4KR2h8EKVbyjyE8mNASFwptcdyVRWv4nxb33AwVITj7PYSojW6P/yU5
	IQEk8v+rqk/V3mywDJntfMa+JoLyZo3ifnSE02tZkjhCFtmREiEnleE5tPch74sC11on
	ZB5g==
X-Gm-Message-State: AEkoouvNxPqGSuwhkAvx8NZ4rBRbUtSVNvu5MXl7vbQ2Ul/PCTLLbOGOHCRi8FcZM/iKH3NqxTwtaR0UD+M+JA==
X-Received: by 10.194.178.102 with SMTP id cx6mr64927738wjc.58.1470298054982; 
	Thu, 04 Aug 2016 01:07:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.209.140 with HTTP; Thu, 4 Aug 2016 01:07:34 -0700 (PDT)
From: Christian Litjes <cflitjes@gmail.com>
Message-ID: <CA+1SGi9iTiTOAt77B7kZXzD+QUGbiQ7g6rKZJFo0BUyPGrqnog@mail.gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Fri, 19 Aug 2016 18:30:18 -0700
Subject: Patch loadaddr for linux-ti-staging_4.4.bb
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
Date: Thu, 04 Aug 2016 08:07:40 -0000
X-Original-Date: Thu, 4 Aug 2016 09:07:34 +0100
X-List-Received-Date: Thu, 04 Aug 2016 08:07:40 -0000
X-Groupsio-MsgNum: 8887
Content-Type: multipart/mixed; boundary=089e013d1c7a481b9405393a7158

--089e013d1c7a481b9405393a7158
Content-Type: multipart/alternative; boundary=089e013d1c7a481b9005393a7156

--089e013d1c7a481b9005393a7156
Content-Type: text/plain; charset=UTF-8

Hi,

I've been using the linux-ti-staging_4.4.bb recipe from the master. When I
decided to swap back to the stable krogoth. The build failed because
uImages are not supported anymore because the LOADADDR was missing.

Kind Regards,
Christian Litjes

--089e013d1c7a481b9005393a7156
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>I&#39;ve been using the <a=
 href=3D"http://linux-ti-staging_4.4.bb">linux-ti-staging_4.4.bb</a> recipe=
 from the master. When I decided to swap back to the stable krogoth. The bu=
ild failed because uImages are not supported anymore because the LOADADDR w=
as missing.<br><br></div>Kind Regards,<br></div>Christian Litjes<br><div><d=
iv><br></div></div></div>

--089e013d1c7a481b9005393a7156--

--089e013d1c7a481b9405393a7158
Content-Type: text/x-patch; charset=US-ASCII; name="linux_4.4_loadaddr.patch"
Content-Disposition: attachment; filename="linux_4.4_loadaddr.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_irg1ggsy0

RnJvbSA1ZjU3YmNlNjEzMTdkYTc2YjQyMzg5YTY1ODQ3NWRkMDBiMjA3Mjc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpc3RpYW4gTGl0amVzIDxjaHJpc3RpYW5saXRqZXNAaG90
bWFpbC5jb20+CkRhdGU6IFRodSwgNCBBdWcgMjAxNiAwODo1OToyMSArMDEwMApTdWJqZWN0OiBb
UEFUQ0ggMS8xXSBBZGRlZCBtaXNzaW5nIExPQURBRERSIHRvIHN1cHBvcnQgYnVpbGRpbmcgdUlt
YWdlcyBhZ2FpbgoKLS0tCiByZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC10aS1zdGFnaW5nXzQu
NC5iYiB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC10aS1zdGFnaW5nXzQuNC5iYiBiL3JlY2lwZXMt
a2VybmVsL2xpbnV4L2xpbnV4LXRpLXN0YWdpbmdfNC40LmJiCmluZGV4IDAyMDA3MTUuLjY3NzJj
M2UgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXRpLXN0YWdpbmdfNC40
LmJiCisrKyBiL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXRpLXN0YWdpbmdfNC40LmJiCkBA
IC02Nyw2ICs2Nyw4IEBAIEtFUk5FTF9ERVZJQ0VUUkVFX2syZS1ldm0gPSAia2V5c3RvbmUtazJl
LWV2bS5kdGIiCiBLRVJORUxfREVWSUNFVFJFRV9rMmctZXZtID0gImtleXN0b25lLWsyZy1ldm0u
ZHRiIgogS0VSTkVMX0RFVklDRVRSRUVfazJsLWV2bSA9ICJrZXlzdG9uZS1rMmwtZXZtLmR0YiIK
IAorS0VSTkVMX0VYVFJBX0FSR1MgKz0gIkxPQURBRERSPSR7VUJPT1RfRU5UUllQT0lOVH0iCisK
IENPTVBBVElCTEVfTUFDSElORSA9ICJ0aTMzeHx0aTQzeHxvbWFwLWExNXxvbWFwM3xvbWFwNHxr
ZXlzdG9uZSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuNy40Cgo=

--089e013d1c7a481b9405393a7158--
