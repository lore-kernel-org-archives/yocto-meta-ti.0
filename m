Return-Path: <bmentink@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A053E016B7
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 11:33:06 -0700 (PDT)
Received: by mail-pa0-f41.google.com with SMTP id bj1so4539499pad.14
	for <meta-ti@yoctoproject.org>; Fri, 04 Oct 2013 11:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:subject:message-id:importance:from:to:reply-to:mime-version
	:content-type; bh=6Q/eTqIs0STvehDA4kxbouzMF8jeEw8rwnuMJP0/Y64=;
	b=xwmCquy5z5gl1q9hPYDEPs4ERUVnTkaIOF7C5uC+l5LN7lYQfXJFK00y6obfRPnOEO
	ffqV68OgtAI7xGBJwu2rXj/sY4ncj2NnVThsjH7N8vAanMmEC2iZcJvD4su4rvavqPFO
	z94p48eCRpxQ1XmvLI2/yZhQCJdzAnzxpa//gQTQ5aACbrOOSidsobhlTxbNxTEXGHNm
	ex8vSxB9TgnkmplS1BalIpL71WIRbnd95eWcUp4/mhtfz3w6fD/x0+slt5ObDkc8xelj
	JsGHoAhMDlD2MxUdzBid3ej1xDDDQqbXSnQqx5owwW4S7bC8kTDC50K6mFvd6YNjbK9I
	J5oA==
X-Received: by 10.66.179.143 with SMTP id dg15mr17284808pac.52.1380911586544; 
	Fri, 04 Oct 2013 11:33:06 -0700 (PDT)
Received: from [192.168.1.74] (182.249.69.111.dynamic.snap.net.nz.
	[111.69.249.182]) by mx.google.com with ESMTPSA id
	go4sm16240508pbb.15.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 11:33:05 -0700 (PDT)
Date: Sat, 05 Oct 2013 07:27:54 +1300
Message-ID: <tw8uf8cbqu0w8kxjs3nsu24x.1380911274107@email.android.com>
Importance: normal
From: bmentink <bmentink@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
MIME-Version: 1.0
Subject: User space drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: bmentink <bmentink@gmail.com>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Oct 2013 18:33:07 -0000
Content-Type: multipart/alternative;
	boundary="--_com.android.email_8601667852737280"

----_com.android.email_8601667852737280
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

CkhpIGFsbCwKCkkgYW0gd2FudGluZyB0byBpbXBsZW1lbnQgYSB1c2VyIHNwYWNlIGRyaXZlciBj
b21wbGV0ZSB3aXRoIGludGVycnVwdCBpbiB5b2N0by4KSSBzZWUgdGhhdCB0aGVyZSBpcyBhIHNh
bXBsZSBnZW5lcmljIHBsYXRmb3JtIGRyaXZlciBpbiB0aGUga2VybmVsLCBidXQgbm90IHN1cmUg
aG93IHRvIHVzZSBpdC4KClNheSBpIHdhbnQgdG8gdGFsayB0byBHUElPIElzIGl0IHNpbXBseSBh
IG1hdHRlciBvZiBwb2ludGluZyB0aGUgLmR0cyBlbnRyeSBmb3IgdGhlIGRyaXZlciB0byB0aGUg
dWlvIGRyaXZlcj8KCkFueSBwb2ludGVycyB3b3VsZCBiZSB2ZXJ5IGhlbHBmdWwgLi4KCkNoZWVy
cywKQmVybmllCgoKClNlbnQgZnJvbSBTYW1zdW5nIHRhYmxldA==

----_com.android.email_8601667852737280
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPjwvaGVhZD48Ym9keSA+PGRpdj48YnI+PC9kaXY+PGRpdj5I
aSBhbGwsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGFtIHdhbnRpbmcgdG8gaW1wbGVtZW50
IGEgdXNlciBzcGFjZSBkcml2ZXIgY29tcGxldGUgd2l0aCBpbnRlcnJ1cHQgaW4geW9jdG8uPC9k
aXY+PGRpdj5JIHNlZSB0aGF0IHRoZXJlIGlzIGEgc2FtcGxlIGdlbmVyaWMgcGxhdGZvcm0gZHJp
dmVyIGluIHRoZSBrZXJuZWwsIGJ1dCBub3Qgc3VyZSBob3cgdG8gdXNlIGl0LjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+U2F5IGkgd2FudCB0byB0YWxrIHRvIEdQSU8gSXMgaXQgc2ltcGx5IGEg
bWF0dGVyIG9mIHBvaW50aW5nIHRoZSAuZHRzIGVudHJ5IGZvciB0aGUgZHJpdmVyIHRvIHRoZSB1
aW8gZHJpdmVyPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QW55IHBvaW50ZXJzIHdvdWxkIGJl
IHZlcnkgaGVscGZ1bCAuLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2hlZXJzLDwvZGl2Pjxk
aXY+QmVybmllPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTAwJSI+U2VudCBmcm9tIFNhbXN1bmcgdGFi
bGV0PC9kaXY+PC9kaXY+IDwvYm9keT48L2h0bWw+

----_com.android.email_8601667852737280--
