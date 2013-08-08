Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99B20E01480
	for <meta-ti@yoctoproject.org>; Thu,  8 Aug 2013 12:44:19 -0700 (PDT)
Received: by mail-ob0-f180.google.com with SMTP id up14so5488921obb.39
	for <meta-ti@yoctoproject.org>; Thu, 08 Aug 2013 12:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dHavp7NKNVf5ki+YV4r62Jg4T0K2KC3wwiBhrGRllQE=;
	b=tE+XommbH/ZwdETa74Eg+GzRmpn+ajjybro4OAa0nU4HnwvZR/Ljj4h5yhyPjbvdqI
	JAMylxRQMbPcRj9FDwZlpqECpjMoWcEssFAnjch62DGsOU84X2D+Q7dwskoV9qT4wklV
	rPK488CEYO7bjortYlAZNQZY7aB2lCQmkny+F+wG3ZzFQtnXD/cdBpjycBsBaQx17U9l
	vI1rPc9iJPGN7+sM76FHik8TCEuyYGI5zeJj7LdqkKWq/gY/qcGu+TNFF5aoIMLBEuAv
	iWWSqoCs/YjOJuEEyqZwvedS3gyFvafPyywUymN4UBUVTs/D/SPwQVl0bB+u7/9mFCkl
	E6HQ==
MIME-Version: 1.0
X-Received: by 10.182.56.197 with SMTP id c5mr432159obq.51.1375991059050; Thu,
	08 Aug 2013 12:44:19 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 8 Aug 2013 12:44:18 -0700 (PDT)
In-Reply-To: <CAFZh4h9NOEKpS1P+WU9r7EXCA4wUx1dQ85CZ+Z0LB5Vk-fAfPQ@mail.gmail.com>
References: <CAFZh4h9NOEKpS1P+WU9r7EXCA4wUx1dQ85CZ+Z0LB5Vk-fAfPQ@mail.gmail.com>
Date: Thu, 8 Aug 2013 15:44:18 -0400
Message-ID: <CAFZh4h9BoYmsXP6tpENmA9_6_5DqEQ2X26A4vGdO+3SLawhncA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Re: populate_sdk for am1808-evm image causes binutils errors (yocto master, meta-ti master, oe master) x86_64-linux-libtool: line 552: CDPATH: command not found
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
X-List-Received-Date: Thu, 08 Aug 2013 19:44:20 -0000
Content-Type: multipart/alternative; boundary=001a11c2578249f61004e374e2dd

--001a11c2578249f61004e374e2dd
Content-Type: text/plain; charset=ISO-8859-1

Update.  This looks like just some kind of bug from doing a git pull.  I
did a fresh checkout and rebuilt everything and I didn't run into this
problem again.

Sorry for the noise.  I kept my other view that had the problem so if
anyone wants me to try anything to figure out why a git pull broke
something then just let me know.

Regards,

Brian

--001a11c2578249f61004e374e2dd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Update. =A0This looks like just some kind of bug from doing a git pull. =A0=
I did a fresh checkout and rebuilt everything and I didn&#39;t run into thi=
s problem again.<div><br></div><div>Sorry for the noise. =A0I kept my other=
 view that had the problem so if anyone wants me to try anything to figure =
out why a git pull broke something then just let me know.</div>
<div><br></div><div>Regards,</div><div><br></div><div>Brian</div><div><br><=
/div>

--001a11c2578249f61004e374e2dd--
